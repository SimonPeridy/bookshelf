import datetime
import json
from enum import Enum
from math import pi
from typing import List, Union

from bokeh.embed import components
from bokeh.models import ColorBar, ColumnDataSource, DataRange1d, FactorRange
from bokeh.models.tickers import FixedTicker
from bokeh.palettes import *
from bokeh.plotting import figure
from bokeh.transform import linear_cmap
from django.db import transaction
from django.db.models import Avg, Count, Func, Max, Q, Value
from django.db.models.functions import Concat, Lower
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.template import loader
from django.utils.translation import gettext_lazy as _
from loguru import logger

from .form import AddBookForm
from .models import Author, Book, WrittenBy
from .utils import Round2, get_cover_address

COVER_NOT_FOUND = "https://www.nypl.org/scout/_next/image?url=https%3A%2F%2Fdrupal.nypl.org%2Fsites-drupal%2Fdefault%2Ffiles%2Fstyles%2Fmax_width_960%2Fpublic%2Fblogs%2FJ5LVHEL.jpg%3Fitok%3DDkMp1Irh&w=1920&q=90"

logger.add("logs/log_{time}.log", rotation="00:00", diagnose=True)


def index(request):
    logger.info("Requesting index page...")
    nb_books = Book.objects.filter(reading_state="read").count()
    context = {"nb_books": nb_books}
    best_author_datas = best_author_bar_chart_view(request)
    number_books_read_by_author = small_author_bar_chart_view(request)
    context = {**context, **best_author_datas, **number_books_read_by_author}
    logger.debug(f"Context : {context}")
    return render(request, "bookshelv/index.html", context)


def get_search_result(
    author_name: str, book_name: str
) -> Tuple[List[Author], List[Book]]:
    queryset = Author.objects.annotate(
        full_name=Concat("firstname", Value(" "), "lastname")
    )
    base_list = WrittenBy.objects.filter(
        Q(book__title__icontains=book_name)
        & Q(book__reading_state="read")
        & Q(
            author_id__in=queryset.filter(full_name__icontains=author_name).values("id")
        )
    )
    base_list_2 = WrittenBy.objects.filter(
        Q(book__title__icontains=book_name)
        & Q(book__reading_state="reading")
        & Q(
            author_id__in=queryset.filter(full_name__icontains=author_name).values("id")
        )
    )
    base_list_3 = WrittenBy.objects.filter(
        Q(book__title__icontains=book_name)
        & Q(book__reading_state="to be read")
        & Q(
            author_id__in=queryset.filter(full_name__icontains=author_name).values("id")
        )
    )
    author_list = Author.objects.filter(id__in=base_list.values("author_id"))
    book_list = Book.objects.filter(id__in=base_list.values("book_id"))
    return list(author_list), list(book_list)


def search(request):
    logger.info("Looking for a book or an author in the database...")
    if request.method == "POST" and (
        request.POST.get("author_name") is not None
        or request.POST.get("book_name") is not None
    ):
        author_name = request.POST.get("author_name").strip()
        book_name = request.POST.get("book_name").strip()
        author_list, book_list = get_search_result(author_name, book_name)
        logger.info(f"{len(author_list)} authors and {len(book_list)} books found")
        all = False
    else:
        author_list, book_list = get_search_result("", "")
        logger.info(
            f"All {len(book_list)} books and {len(author_list)} authors returned"
        )
        all = True
    # nécessaire pour que les auteurs "None" rajoutés ne s'affichent pas lors de la recherche
    nb_author = len(author_list)
    author_list.extend(["None"] * (len(book_list) - len(author_list)))
    formatted_list = zip(author_list, book_list)
    context = {
        "author_list": author_list,
        "book_list": book_list,
        "nb_authors": nb_author,
        "nb_books": len(book_list),
        "formatted_list": formatted_list,
    }
    if (
        not all
    ):  # TODO trouver comment afficher la page complètement remplie au début, puis suivre les requêtes en utilisant toujours le même template
        return render(request, "bookshelv/search.html", context)
    return render(request, "bookshelv/author_list.html", context)


def get_all_authors() -> List[Author]:
    queryset = Author.objects.annotate(
        full_name=Concat("lastname", Value(", "), "firstname")
    )
    authors_list = list(queryset.values_list("full_name", flat=True))
    return authors_list


def get_authors(request):
    logger.info("Requesting the authors...")
    if request.method == "POST":
        if request.POST.get("author_name"):
            author_set_start = Author.objects.annotate(
                full_name=Concat("lastname", Value(", "), "firstname")
            ).filter(full_name__istartswith=request.POST.get("author_name"))
            author_set_contains = Author.objects.annotate(
                full_name=Concat("lastname", Value(", "), "firstname")
            ).filter(full_name__icontains=request.POST.get("author_name"))
            author_list = list(
                author_set_start.values_list("full_name", flat=True)
            ) + list(author_set_contains.values_list("full_name", flat=True))
        else:
            author_list = get_all_authors()
        context = {"author_list": author_list}
        logger.info(f"There is {len(author_list)} authors in the db, all returned.")
        return JsonResponse(context)


def get_series(request):
    logger.info("Requesting the series...")
    if request.method == "POST":
        series_list = (
            Book.objects.values("series")
            .exclude(series__isnull=True)
            .annotate(Max("series_number"))
            .order_by("series")
        )
        series_list = list(series_list)
        context = {"series_list": series_list}
        logger.info(f"{len(series_list)} series found")
        return JsonResponse(context)


def get_cleaned_data(form: AddBookForm) -> Dict:
    cleaned_data = form.cleaned_data()
    author_lastname, author_firstname = map(
        lambda x: x.strip(), form.cleaned_data["author"].split(",")
    )
    series = None if cleaned_data["series"] == "" else None
    return {
        "title": cleaned_data["title"],
        "author_firstname": author_firstname,
        "author_lastname": author_lastname,
        "series": series,
        "series_number": cleaned_data["series_number"],
        "is_ebook": cleaned_data["ebook"],
        "book_type": cleaned_data["book_type"],
        "language": cleaned_data["language"],
        "mark": cleaned_data["mark"],
        "reading_state": cleaned_data["reading_state"],
    }


MODIFICATION = {
    "BOOK_ADDED": _("Votre livre a bien été ajouté à la base de données"),
    "BOOK_MODIFIED": _("Votre livre a bien été modifié dans la base de données"),
    "NO_MODIFICATION": _(
        "Aucune modification n'a été faite, votre liste existait déjà dans la base de données."
    ),
}


def adding_book(cleaned_data: Dict) -> Tuple[Author, Book, str]:
    written_by_list = WrittenBy.objects.filter(
        book__title=cleaned_data["title"],
        book__book_type=cleaned_data["book_type"],
        book__series=cleaned_data["series"],
        book__series_number=cleaned_data["series_number"],
        book__language=cleaned_data["language"],
        author__lastname=cleaned_data["author_lastname"],
        author__firstname=cleaned_data["author_firstname"],
    )
    with transaction.atomic():
        if len(written_by_list) == 0:
            logger.info("Need to add the new book to the database.")
            book = Book.objects.create(
                title=cleaned_data["title"],
                is_ebook=cleaned_data["is_ebook"],
                book_type=cleaned_data["book_type"],
                series=cleaned_data["series"],
                series_number=cleaned_data["series_number"],
                language=cleaned_data["language"],
                mark=cleaned_data["mark"],
                reading_state=cleaned_data["reading_state"],
                date_end_reading=datetime.date.today()
                if cleaned_data["reading_state"] == "read"
                else None,
            )
            book.save()
            author_object = Author.objects.filter(
                firstname__iexact=cleaned_data["author_firstname"],
                lastname__iexact=cleaned_data["author_lastname"],
            )
            if len(author_object) == 0:
                author_object = Author.objects.create(
                    firstname=cleaned_data["author_firstname"],
                    lastname=cleaned_data["author_lastname"],
                )
                logger.info(
                    f"The author {repr(author_object)} doesn't exist, we are creating it."
                )
                author_object.save()
            elif len(author_object) == 1:
                author_object = author_object[0]
                logger.info(
                    f"The author {repr(author_object)} already exists in the database."
                )
            else:
                logger.critical(
                    f"There is a problem with the number of author matching : {repr(author_object)}"
                )
                raise ValueError("Too many authors matching")
            logger.info(
                f"Creating the link between {repr(book)} and {repr(author_object)}."
            )
            written_by = WrittenBy.objects.create(
                book_id=book.id, author_id=author_object.id
            )
            written_by.save()
            modification = "BOOK_ADDED"
        elif len(written_by_list) == 1:
            book = written_by_list[0].book
            author_object = written_by_list[0].author
            logger.info("The book already exists in the database.")
            if book.reading_state == "to be read" and cleaned_data["reading_state"] in (
                "reading",
                "read",
            ):
                book.reading_state = cleaned_data["reading_state"]
                if cleaned_data["reading_state"] == "read":
                    book.date_end_reading = datetime.date.today()
                book.save()
                modification = "BOOK_MODIFIED"
            elif (
                book.reading_state == "reading"
                and cleaned_data["reading_state"] == "read"
            ):
                book.reading_state = cleaned_data["reading_state"]
                book.date_end_reading = datetime.date.today()
                book.save()
                modification = "BOOK_MODIFIED"
            else:
                modification = "NO_MODIFICATION"

        else:
            logger.critical("The book has already several copies in the database.")
            raise ValueError("Too many authors matching")
    return author_object, book, modification


def add_book(request):
    logger.info("Adding the book...")
    if request.method == "POST":
        form = AddBookForm(request.POST)
        if form.is_valid():
            logger.info("Form is valid")
            cleaned_data = get_cleaned_data(form)
            author, book, modification = adding_book(cleaned_data)
            cover_address = get_cover_address(
                book.title,
                author.lastname + " " + author.firstname,
                book.series if book.series is not None else "",
            )
            context = {
                "title": book.title,
                "cover_address": cover_address
                if cover_address is not None
                else COVER_NOT_FOUND,
                "display_text": MODIFICATION[modification],
            }
            return render(request, "bookshelv/validation.html", context)
        else:
            logger.info("Something was wrong in the form : {}".format(form.errors))
            form = AddBookForm()
            return render(request, "bookshelv/add_book.html", {"form": form})
    else:
        form = AddBookForm()
        logger.info("Generating the form...")
        return render(request, "bookshelv/add_book.html", {"form": form})


def series_entry(request):
    logger.info("Loading the series list page...")
    series_list = (
        Book.objects.filter(series__isnull=False)
        .distinct("title", "series")
        .values_list("series", flat=True)
    )
    context = {"nb_series": len(list(series_list)), "series_list": list(series_list)}
    return render(request, "bookshelv/display_series.html", context)


def series_list(request):
    logger.info("Accessing the series...")
    # variable to know if the name of the series is exact (to know if we are returning books or series
    is_exact = False
    if (
        request.POST.get("series_name") is not None
        and request.POST.get("series_name") != ""
    ):
        series_list = (
            Book.objects.filter(
                Q(series__isnull=False)
                & Q(series__exact=request.POST.get("series_name"))
            )
            .order_by("series_number")
            .values("title", "series_number")
        )
        if len(series_list) > 0:
            is_exact = True
        else:
            series_list = (
                Book.objects.filter(
                    Q(series__isnull=False)
                    & Q(series__icontains=request.POST.get("series_name"))
                )
                .distinct("series")
                .order_by("series")
                .values_list("series", flat=True)
            )
    else:
        series_list = (
            Book.objects.filter(series__isnull=False)
            .distinct("series")
            .order_by("series")
            .values_list("series", flat=True)
        )
    nb_series = len(list(series_list))
    context = {
        "nb_series": nb_series,
        "series_list": list(series_list),
        "is_exact": is_exact,
    }
    if is_exact:
        logger.info(
            f"{nb_series} books found for the series {request.POST.get('series_name')}"
        )
        return render(request, "bookshelv/display_books_in_series.html", context)
    else:
        logger.info(f"{nb_series} series found")
        return render(request, "bookshelv/series_list.html", context)


# charting views


def small_author_bar_chart_view(request):
    logger.info("Building the number of books read by author chart")
    labels, data = [], []
    queryset = (
        WrittenBy.objects.values("author_id")
        .annotate(full_name=Concat("author__firstname", Value(" "), "author__lastname"))
        .annotate(count=Count("book_id"))
        .values("full_name", "count")
        .order_by("-count")[:10]
    )
    for mauthor in queryset:
        labels.append(mauthor["full_name"])
        data.append(mauthor["count"])

    plot = figure(
        title="Nombre de livres lus par auteur",
        toolbar_location=None,
        x_range=FactorRange(factors=labels),
        height=320,
        width=400,
    )

    source = ColumnDataSource(dict(x=labels, y=data))
    mapper = linear_cmap(
        field_name="y",
        palette=brewer["PuRd"][9][::-1][2:],
        low=min(data),
        high=max(data),
    )

    # plot.yaxis.axis_label = "Nombre de livres lus"
    plot.xaxis.major_label_orientation = pi / 4
    plot.xaxis.major_tick_line_width = 0
    plot.y_range.range_padding = 0
    plot.vbar(x="x", top="y", width=0.6, color=mapper, source=source)
    plot.yaxis.minor_tick_line_width = 0
    # plot.min_border_bottom = 20
    # plot.min_border_top = 300

    # color_bar = ColorBar(color_mapper=mapper["transform"], width=2)
    # plot.add_layout(color_bar, "right")

    script, div = components(plot)

    return {"script2": script, "div2": div}


def best_author_bar_chart_view(request):
    logger.info("Building the best marked author bar chart")
    # create a plot

    queryset = (
        WrittenBy.objects.values("author_id")
        .exclude(book__mark__isnull=True)
        .annotate(full_name=Concat("author__firstname", Value(" "), "author__lastname"))
        .annotate(avg=Round2(Avg("book__mark")))
        .values("full_name", "avg")
        .annotate(count=Count("book__id"))
        .filter(count__gte=3)
        .order_by("-avg")[:10]
    )
    logger.info(queryset)
    labels, data = [], []
    for element in queryset:
        labels.append(element["full_name"])
        data.append(element["avg"])

    plot = figure(
        title="Note moyenne par auteur",
        toolbar_location=None,
        x_range=FactorRange(factors=labels),
        y_range=DataRange1d(start=0, end=10, range_padding=0),
        height=300,
        width=400,
    )

    source = ColumnDataSource(dict(x=labels, y=data))

    mapper = linear_cmap(
        field_name="y",
        palette=brewer["PuRd"][9][::-1][2:],
        low=min(data),
        high=max(data),
    )

    # plot.yaxis.axis_label = "Note moyenne"
    plot.yaxis.ticker = list(range(1, 11))
    plot.xaxis.major_label_orientation = pi / 4
    plot.xaxis.major_tick_line_width = 0
    plot.y_range.range_padding = 0
    # plot.min_border_bottom = 50
    # plot.min_border_top = 300
    plot.vbar(x="x", top="y", width=0.5, source=source, color=mapper)

    script, div = components(plot)
    return {"script": script, "div": div}


def category_chart(request):
    logger.info("Building the category chart")
    labels, data = [], []
    queryset = Book.objects.values("book_type").annotate(count=Count("book_type"))
    type_list = ["Roman", "Documentaire", "BD / Manga", "Poésie"]
    for element in queryset:
        labels.append(type_list[element["book_type"]])
        data.append(element["count"])
    context = {
        "labels": labels,
        "data": data,
    }
    return JsonResponse(data=context)


def display_charting_page(request):
    return render(request, "bookshelv/charting.html")


def search_book(request):

    pass
