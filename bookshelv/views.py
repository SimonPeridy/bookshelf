import datetime
import json
from loguru import logger

from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse, JsonResponse
from django.template import loader
from django.db.models import Max, Q, Value, Count, Avg, Func
from django.db.models.functions import Lower, Concat
from .form import AddBookForm
from .models import Author, Book, Base
from .utils import Round2, get_cover_address


def index(request):
    logger.info("Requesting index page...")
    nb_books = Book.objects.all().count()
    context = {"nb_books": nb_books}
    return render(request, "bookshelv/index.html", context)


def search(request):
    logger.info("Looking for a book or an author...")
    if request.method == "POST" and (
        request.POST.get("author_name") is not None
        or request.POST.get("book_name") is not None
    ):
        author_name = request.POST.get("author_name").strip()
        book_name = request.POST.get("book_name").strip()
        queryset = Author.objects.annotate(
            full_name=Concat("firstname", Value(" "), "lastname")
        )
        base_list = Base.objects.filter(
            Q(book_id__title__icontains=book_name)
            & Q(
                author_id__in=queryset.filter(full_name__icontains=author_name).values(
                    "id"
                )
            )
        )
        author_list = Author.objects.filter(
            id__in=base_list.values("author_id")
        ).order_by("lastname", "firstname")
        book_list = Book.objects.filter(id__in=base_list.values("book_id")).order_by(
            "series", "title"
        )
        author_list = list(author_list)
        book_list = list(book_list)
        nb_authors = len(author_list)
        nb_books = len(book_list)
        author_list.extend(["None"] * (len(book_list) - len(author_list)))
        formatted_list = zip(author_list, book_list)
        context = {
            "author_list": author_list,
            "book_list": book_list,
            "nb_authors": nb_authors,
            "nb_books": nb_books,
            "formatted_list": formatted_list,
        }

        logger.info(f"{nb_authors} authors and {nb_books} books found")
        return render(request, "bookshelv/search.html", context)
    else:
        author_list = list(Author.objects.order_by("lastname", "firstname"))
        nb_authors = len(author_list)
        book_list = list(Book.objects.order_by("title"))
        nb_books = len(book_list)
        author_list.extend(["None"] * (len(book_list) - len(author_list)))
        formatted_list = zip(author_list, book_list)
        context = {
            "author_list": author_list,
            "book_list": book_list,
            "nb_authors": nb_authors,
            "nb_books": nb_books,
            "formatted_list": formatted_list,
        }
        logger.info("All books and authors returned")
        return render(request, "bookshelv/author_list.html", context)


def get_authors(request):
    logger.info("Requesting the authors...")
    if request.method == "POST":
        queryset = Author.objects.annotate(
            full_name=Concat("lastname", Value(", "), "firstname")
        )
        authors_list = list(queryset.values_list("full_name", flat=True))
        context = {"author_list": authors_list}
        logger.info(f"{len(authors_list)} authors found")
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
        # return render(request,"bookshelv/series_list.html",context)
        return JsonResponse(context)


def add_book(request):
    logger.info("Adding the book...")
    if request.method == "POST":
        form = AddBookForm(request.POST)
        if form.is_valid():
            logger.info("Form is valid")
            if form.cleaned_data["series"] == "":
                series = None
            else:
                series = form.cleaned_data["series"]
            new_book_id = (
                Book.objects.values_list("id", flat=True).aggregate(Max("id"))[
                    "id__max"
                ]
                + 1
            )
            new_book = Book.objects.create(
                title=form.cleaned_data["title"],
                id=new_book_id,
                format=form.cleaned_data["ebook"],
                mark=form.cleaned_data["mark"],
                type=form.cleaned_data["type"],
                date_end_reading=datetime.date.today(),
                series=series,
                series_number=form.cleaned_data["series_number"],
                language=form.cleaned_data["language"],
            )
            new_book.save()
            logger.info("Book added to the list")
            author_lastname, author_firstname = map(
                lambda x: x.strip(), form.cleaned_data["author"].split(",")
            )
            author_object = Author.objects.filter(
                firstname__iexact=author_firstname, lastname__iexact=author_lastname
            )
            if len(author_object) == 1:
                author_id = author_object[0].id
            else:
                author_id = Author.objects.aggregate(Max("id"))["id__max"]
                new_author = Author.objects.create(
                    firstname=author_firstname,
                    lastname=author_lastname,
                    id=author_id + 1,
                )
                new_author.save()
                logger.info("Author created")
            new_base_id = (
                Base.objects.values_list("id", flat=True).aggregate(Max("id"))[
                    "id__max"
                ]
                + 1
            )
            base_object = Base.objects.create(
                id=new_base_id, author_id=author_id, book_id=new_book.id
            )
            base_object.save()
            logger.info("Link between the book and the author added")
            cover_address = get_cover_address(
                new_book.title, author_lastname + " " + author_firstname, series
            )
            context = {"title": new_book.title, "cover_address": cover_address}
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
        .distinct("series")
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
        Base.objects.values("author_id")
        .annotate(full_name=Concat("author__firstname", Value(" "), "author__lastname"))
        .annotate(count=Count("book_id"))
        .values("full_name", "count")
        .order_by("-count")[:10]
    )
    for mauthor in queryset:
        labels.append(mauthor["full_name"])
        data.append(mauthor["count"])
    context = {
        "labels": labels,
        "data": data,
    }
    return JsonResponse(data=context)


def best_author_bar_chart_view(request):
    logger.info("Building the best marked author bar chart")
    labels, data = [], []
    queryset = (
        Base.objects.values("author_id")
        .exclude(book__mark__isnull=True)
        .annotate(full_name=Concat("author__firstname", Value(" "), "author__lastname"))
        .annotate(avg=Round2(Avg("book__mark")))
        .values("full_name", "avg")
        .order_by("-avg")[:10]
    )
    for element in queryset:
        labels.append(element["full_name"])
        data.append(element["avg"])
    context = {
        "labels": labels,
        "data": data,
    }
    return JsonResponse(data=context)


def category_chart(request):
    logger.info("Building the category chart")
    labels, data = [], []
    queryset = Book.objects.values("type").annotate(count=Count("type"))
    type_list = ["Roman", "Documentaire", "BD / Manga", "Poésie"]
    for element in queryset:
        labels.append(type_list[element["type"]])
        data.append(element["count"])
    context = {
        "labels": labels,
        "data": data,
    }
    return JsonResponse(data=context)


def display_charting_page(request):
    return render(request, "bookshelv/charting.html")
