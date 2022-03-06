import datetime
import json
from loguru import logger

from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse, JsonResponse
from django.template import loader
from django.db.models import Max, Q, Value
from django.db.models.functions import Lower, Concat
from .form import AddBookForm
from .models import Author, Book, Base


def index(request):
    nb_books = Book.objects.all().count()
    context = {"nb_books": nb_books}
    return render(request, 'bookshelv/index.html', context)


def search(request):
    if request.method == "POST" and (
            request.POST.get("author_name") is not None or request.POST.get("book_name") is not None):
        author_name = request.POST.get("author_name").strip()
        book_name = request.POST.get("book_name").strip()
        queryset = Author.objects.annotate(full_name=Concat("firstname", Value(" "), "lastname"))
        base_list = Base.objects.filter(Q(book_id__title__icontains=book_name) & Q(
            author_id__in=queryset.filter(full_name__icontains=author_name).values("id")))
        author_list = Author.objects.filter(id__in=base_list.values("author_id")).order_by("lastname", "firstname")
        book_list = Book.objects.filter(id__in=base_list.values("book_id")).order_by("series", "title")
        author_list = list(author_list)
        book_list = list(book_list)
        nb_authors = len(author_list)
        nb_books = len(book_list)
        author_list.extend(["None"] * (len(book_list) - len(author_list)))
        formatted_list = zip(author_list, book_list)
        context = {"author_list": author_list, "book_list": book_list, "nb_authors": nb_authors, "nb_books": nb_books,
                   "formatted_list": formatted_list}
        return render(request, 'bookshelv/search.html', context)
    else:
        author_list = list(Author.objects.order_by("lastname", "firstname"))
        nb_authors = len(author_list)
        book_list = list(Book.objects.order_by("title"))
        nb_books = len(book_list)
        author_list.extend(["None"] * (len(book_list) - len(author_list)))
        formatted_list = zip(author_list, book_list)
        context = {"author_list": author_list, "book_list": book_list, "nb_authors": nb_authors, "nb_books": nb_books,
                   "formatted_list": formatted_list}
        return render(request, 'bookshelv/author_list.html', context)


def get_authors(request):
    if request.method == "POST":
        queryset = Author.objects.annotate(full_name=Concat("lastname", Value(", "), "firstname"))
        authors_list = list(queryset.values_list("full_name", flat=True))
        context = {"author_list": authors_list}
        return JsonResponse(context)


def get_series(request):
    if request.method == "POST":
        series_list = Book.objects.values("series").exclude(series__isnull=True).annotate(
            Max("series_number")).order_by("series")
        series_list = list(series_list)
        context = {"series_list": series_list}
        return JsonResponse(context)


def add_book(request):
    logger.info("Adding the book...")
    if request.method == "POST":
        form = AddBookForm(request.POST)
        if form.is_valid():
            logger.info("Form is valid")
            new_book_id = Book.objects.values_list("id", flat=True).aggregate(Max("id"))["id__max"] + 1
            new_book = Book.objects.create(title=form.cleaned_data["title"], id=new_book_id,
                                           format=form.cleaned_data["ebook"], mark=form.cleaned_data["mark"],
                                           type=form.cleaned_data["type"], date_end_reading=datetime.date.today(),
                                           series=form.cleaned_data["series"],
                                           series_number=form.cleaned_data["series_number"],
                                           language=form.cleaned_data["language"])
            new_book.save()
            logger.info("Book added to the list")
            author_lastname, author_firstname = map(lambda x: x.strip(), form.cleaned_data["author"].split(","))
            author_object = Author.objects.filter(firstname__iexact=author_firstname, lastname__iexact=author_lastname)
            if len(author_object) == 1:
                author_id = author_object[0].id
            else:
                author_id = Author.objects.aggregate(Max("id"))
                new_author = Author.objects.create(firstname=author_firstname, lastname=author_lastname,
                                                   id=author_id + 1)
                new_author.save()
                logger.debug("Author created")
            new_base_id = Base.objects.values_list("id", flat=True).aggregate(Max("id"))["id__max"] + 1
            base_object = Base.objects.create(id=new_base_id, author_id=author_id, book_id=new_book.id)
            base_object.save()
            logger.info("Link between the book and the author added")
            context = {"title": new_book.title}
            return render(request, "bookshelv/validation.html", context)
        else:
            form = AddBookForm()
            return render(request, 'bookshelv/add_book.html', {'form': form})
    else:
        form = AddBookForm()
        return render(request, 'bookshelv/add_book.html', {'form': form})
