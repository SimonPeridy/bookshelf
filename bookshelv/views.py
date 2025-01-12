import datetime
import json
from enum import Enum
from math import pi
from typing import Dict, List, Tuple, Union

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from bokeh.embed import components
from bokeh.models import ColorBar, ColumnDataSource, DataRange1d, FactorRange, Span
from bokeh.models.tickers import FixedTicker
from bokeh.palettes import *
from bokeh.palettes import TolPRGn4
from bokeh.plotting import figure
from bokeh.transform import linear_cmap
from django.db import transaction
from django.db.models import (
    Avg,
    Count,
    F,
    FilteredRelation,
    Func,
    Max,
    Q,
    StdDev,
    Value,
)
from django.db.models.functions import Concat, Lower
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.template import loader
from django.utils.translation import gettext_lazy as _
from django_pandas.io import read_frame
from loguru import logger
from nltk.corpus import stopwords
from PIL import Image
from wordcloud import STOPWORDS, WordCloud

from .form import AddBookForm
from .models import Author, Book, WrittenBy
from .utils import Round2, get_all_titles, get_cover_address, to_tuple

COVER_NOT_FOUND = "https://www.nypl.org/scout/_next/image?url=https%3A%2F%2Fdrupal.nypl.org%2Fsites-drupal%2Fdefault%2Ffiles%2Fstyles%2Fmax_width_960%2Fpublic%2Fblogs%2FJ5LVHEL.jpg%3Fitok%3DDkMp1Irh&w=1920&q=90"
CUSTOM_STOPWORDS = ["sous", "los", "un", "deux", "one", "entre"]

logger.add("logs/log_{time}.log", rotation="1 week", backtrace=True, diagnose=True)


def index(request):
    logger.info("Requesting index page...")
    nb_books = Book.objects.filter(reading_state="read").count()
    nb_authors = (
        WrittenBy.objects.filter(book__reading_state="read")
        .distinct("author_id")
        .count()
    )
    context = {"nb_books": nb_books, "nb_authors": nb_authors}
    best_author_datas = best_author_bar_chart_view(request)
    number_books_read_by_author = small_author_bar_chart_view(request)
    book_by_language_by_year = book_by_language_by_year_chart_view(request)
    context = {
        **context,
        **best_author_datas,
        **number_books_read_by_author,
        **book_by_language_by_year,
    }
    # logger.debug(f"Context : {context}")
    return render(request, "bookshelv/index.html", context)


def get_search_result(  # can only sort or search, not do both
    author_name: str,
    book_name: str,
    author_sort_by: str = "alphab",
    book_sort_by: str = "alphab",
) -> Tuple[List[Author], List[Book]]:
    sort_mapping = {
        "alphab": ["lastname", "firstname"],
        "nalphab": ["-lastname", "-firstname"],
        "num_books": "TBD",
    }
    queryset = Author.objects.annotate(
        full_name=Concat("lastname", Value(", "), "firstname")
    )
    base_list = WrittenBy.objects.filter(
        Q(book__title__icontains=book_name)
        & Q(
            author_id__in=queryset.filter(full_name__icontains=author_name).values("id")
        )
    )
    author_list = Author.objects.filter(id__in=base_list.values("author_id")).order_by(
        *sort_mapping[author_sort_by]
    )
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
    # elif request.method == "GET":
    else:
        book_sort_by = request.GET.get("book_sort_by", "alphab")
        author_sort_by = request.GET.get("author_sort_by", "alphab")
        logger.debug(book_sort_by)
        logger.debug(author_sort_by)
        author_list, book_list = get_search_result("", "", author_sort_by, book_sort_by)
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


def search_json(request):
    logger.info("Looking for books or authors in the database...")

    author_name = request.GET.get("author_name", "").strip()
    book_name = request.GET.get("book_name", "").strip()
    book_sort_by = request.GET.get("book_sort_by", "alphab")
    author_sort_by = request.GET.get("author_sort_by", "alphab")

    logger.debug(book_sort_by)
    logger.debug(author_sort_by)
    author_list, book_list = get_search_result(
        author_name, book_name, author_sort_by, book_sort_by
    )
    logger.info(f"{len(book_list)} books and {len(author_list)} authors returned")
    # nécessaire pour que les auteurs "None" rajoutés ne s'affichent pas lors de la recherche
    nb_author = len(author_list)
    author_list.extend(["None"] * (len(book_list) - len(author_list)))
    # formatted_list = zip(author_list, book_list)
    context = {
        "author_list": author_list,
        "book_list": book_list,
        "nb_authors": nb_author,
        "nb_books": len(book_list),
        # "formatted_list": formatted_list,
    }
    return render(request, "bookshelv/search.html", context)
    # return JsonResponse(context)


def get_all_authors() -> List[Author]:
    queryset = Author.objects.annotate(
        full_name=Concat("lastname", Value(", "), "firstname")
    )
    authors_list = list(queryset.values_list("full_name", flat=True))
    return authors_list


def get_books(request):
    book_queryset = Book.objects.all()
    book_queryset = book_queryset.annotate(
        author_lastname=F("writtenby__author__lastname"),
        author_firstname=F("writtenby__author__firstname"),
    )

    df_books = read_frame(book_queryset)
    df_books["date_end_reading"].fillna("", inplace=True)
    df_books["series"].fillna("", inplace=True)
    df_books.drop(
        columns=["id", "is_ebook", "language", "reading_state", "progression"],
        inplace=True,
    )

    df_books.set_index("author_lastname", inplace=True)
    # formating to make it look better
    df_books.columns.name = "Nom"
    df_books.index.name = None
    df_books.rename(
        columns={
            "author_firstname": "Prénom",
            "title": "Titre",
            "series": "Serie",
            "series_number": "Numéro",
            "mark": "Note",
            "date_end_reading": "Date de fin",
        },
        inplace=True,
    )
    df_books = df_books[
        [
            "Prénom",
            "Titre",
            "Serie",
            "Numéro",
            "Note",
            "Date de fin",
        ]
    ]
    # logger.info(df_books.to_json(orient="records"))
    # JsonResponse(df_books.to_json(orient="records"), safe=False)

    return JsonResponse(
        df_books.to_html(
            # header=True,
            na_rep="",
            float_format="%d",
            # justify="center",
            # classes="dataframe table-bordered table-striped table-hover",
            classes="display",
            table_id="books",
            # escape=False,
        ),
        safe=False,
    )


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
            # making sure to write only once each author (as authors starting by "adl" also contain "adl")
            list_author_start = list(
                author_set_start.values_list("full_name", flat=True)
            )
            author_list = list_author_start + [
                author
                for author in author_set_contains.values_list("full_name", flat=True)
                if author not in list_author_start
            ]
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
    cleaned_data = form.cleaned_data
    author_lastname, author_firstname = map(
        lambda x: x.strip(), form.cleaned_data["author"].split(",")
    )
    series = None if cleaned_data["series"] == "" else cleaned_data["series"]
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
        "reading_state": (
            cleaned_data["reading_state"]
            if "reading_state" in cleaned_data.keys()
            else "read"
        ),
        "date_end_reading": cleaned_data["date_end_reading"],
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
                id=Book.objects.latest("id").id + 1,
                title=cleaned_data["title"],
                is_ebook=cleaned_data["is_ebook"],
                book_type=cleaned_data["book_type"],
                series=cleaned_data["series"],
                series_number=cleaned_data["series_number"],
                language=cleaned_data["language"],
                mark=cleaned_data["mark"],
                reading_state=cleaned_data["reading_state"],
                date_end_reading=(
                    cleaned_data["date_end_reading"]
                    if cleaned_data["reading_state"] == "read"
                    else None
                ),
            )
            book.save()
            author_object = Author.objects.filter(
                firstname__iexact=cleaned_data["author_firstname"],
                lastname__iexact=cleaned_data["author_lastname"],
            )
            if len(author_object) == 0:
                author_object = Author.objects.create(
                    id=Author.objects.latest("id").id + 1,
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
                id=WrittenBy.objects.latest("id").id + 1,
                book_id=book.id,
                author_id=author_object.id,
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
                    book.date_end_reading = cleaned_data["date_end_reading"]
                book.save()
                modification = "BOOK_MODIFIED"
            elif (
                book.reading_state == "reading"
                and cleaned_data["reading_state"] == "read"
            ):
                book.reading_state = cleaned_data["reading_state"]
                book.date_end_reading = cleaned_data["date_end_reading"]
                book.save()
                modification = "BOOK_MODIFIED"
            else:
                modification = "NO_MODIFICATION"

        else:
            logger.critical("The book has already several copies in the database.")
            raise ValueError("Too many authors matching")
    return author_object, book, modification


# FORM_TEMPLATE = "bookshelv/add_book_form.html" # can't make it as personalized as I would like to
FORM_TEMPLATE = "bookshelv/add_book.html"


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
                "cover_address": (
                    cover_address if cover_address is not None else COVER_NOT_FOUND
                ),
                "display_text": MODIFICATION[modification],
            }
            return render(request, "bookshelv/validation.html", context)
        else:
            logger.error("Something was wrong in the form : {}".format(form.errors))
            # form = AddBookForm()
            return render(request, FORM_TEMPLATE, {"form": form})
    else:
        form = AddBookForm()
        logger.info("Generating the form...")
        return render(request, FORM_TEMPLATE, {"form": form})


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
    logger.debug(queryset)
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
    logger.debug(queryset)
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


def book_by_language_by_year_chart_view(request):
    logger.info("Building the book by language by year chart")

    queryset = (
        Book.objects.exclude(date_end_reading__isnull=True)
        .values("language", "date_end_reading__year")
        .annotate(c=Count("language"))
    )

    df = read_frame(queryset).sort_values(by=["date_end_reading__year", "language"])
    years = sorted(df["date_end_reading__year"].unique().astype("str"))
    logger.debug(f"years : {years}")

    res = df.groupby("date_end_reading__year").sum()
    plotting_data_total_per_year = list(res.to_dict()["c"].values())
    logger.debug(f"plotting_data_total_per_year : {plotting_data_total_per_year}")

    list_language_year = to_tuple(
        df[["date_end_reading__year", "language"]]
        .astype({"date_end_reading__year": "str"})
        .values.tolist()
    )
    logger.debug(f"list_language_year : {list_language_year}")

    data_language_year = to_tuple(df["c"].values.tolist())
    logger.debug(f"data_language_year : {data_language_year}")

    fill_color, line_color = TolPRGn4[2:]

    plot = figure(
        title="Livres lus par langue par année",
        toolbar_location=None,
        tools="",
        x_range=FactorRange(*list_language_year),
        height=300,
        # width=400,
        background_fill_color="#fafafa",
    )

    plot.vbar(
        x=list_language_year,
        top=data_language_year,
        width=0.8,
        fill_color=fill_color,
        fill_alpha=0.8,
        line_color=line_color,
        line_width=1.2,
    )
    hline = Span(location=52, dimension="width", line_color="red", line_width=1)
    plot.line(
        x=years,
        y=plotting_data_total_per_year,
        color="grey",
        line_width=1,
    )
    plot.circle(
        x=years,
        y=plotting_data_total_per_year,
        size=3,
        line_color="blue",
        fill_color="white",
        line_width=1,
    )
    plot.renderers.extend([hline])

    plot.yaxis.axis_label = "Nombre de livres lus"
    plot.xaxis.major_label_orientation = pi / 4
    # plot.xaxis.major_tick_line_width = 0
    # plot.y_range.range_padding = 0

    plot.y_range.start = 0
    plot.x_range.range_padding = 0.1
    plot.xgrid.grid_line_color = None

    script, div = components(plot)

    return {"script3": script, "div3": div}


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


def create_wordcloud(request):
    all_titles: str = get_all_titles()
    stop_words = (
        stopwords.words("english") + stopwords.words("french") + CUSTOM_STOPWORDS
    )
    # stop_words = stop_words.union({",", ";", ":", "!", "?", ".", "une"})
    final_list = []
    for word in all_titles.split():
        if (l_word := word.lower()) not in stop_words:
            if any(l_word.startswith(e) for e in ["l'", "d'", "s'", "n'"]):
                final_list.append(l_word[2:])
            else:
                final_list.append(l_word)
    # pic = np.array(
    #     Image.open(
    #         requests.get(
    #             # "http://www.clker.com/cliparts/O/i/x/Y/q/P/yellow-house-hi.png",
    #             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiVZOPF6fPQ6SxN-1aE7VPji3PJ9SaAWs13Q&usqp=CAU",
    #             stream=True,
    #         ).raw
    #     )
    # )
    wordcloud = WordCloud(
        width=16 * 60,
        height=9 * 60,
        background_color="white",
        stopwords=None,
        # mask=pic,
        # contour_width=1,
        min_font_size=10,
        max_words=200,
        include_numbers=True,
        relative_scaling=1,
    ).generate(" ".join(final_list))
    img = wordcloud.to_image()
    img.save("./static/images/wordcloud.png")
    return render(request, "bookshelv/wordcloud.html", None)
