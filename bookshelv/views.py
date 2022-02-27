import datetime
import json

from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.template import loader
from django.db.models import Max, Q
from django.db.models.functions import Lower
from .form import AddBookForm
from .models import Author, Book, Base


def index(request):
    nb_books = Book.objects.all().count()
    context = {"nb_books": nb_books}
    return render(request, 'bookshelv/index.html', context)


def author_details(request, author_id):
    # l = Author.objects.get(id=author_id)
    # return HttpResponse("You're looking at author {} with all these books : {}.".format(author_id, l.lastname))
    l = Book.objects.filter(base__author_id=author_id).order_by("title")
    context = {"my_list": l, "author": Author.objects.filter(id=author_id).get()}
    return render(request, 'bookshelv/author_details.html', context)


def search(request):
    if request.method == "POST" and request.POST.get("author_name") is not None:
        author_name = request.POST.get("author_name")
        author_list = Author.objects.filter(
            Q(firstname__icontains=author_name) | Q(lastname__icontains=author_name)).order_by("lastname", "firstname")
        book_list = Book.objects.filter(
            id__in=Base.objects.filter(author_id__in=author_list.values("id")).values("book_id")).order_by("title")
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
        author_list = list(Author.objects.order_by("lastname"))
        nb_authors = len(author_list)
        book_list = list(Book.objects.order_by("title"))
        nb_books = len(book_list)
        author_list.extend(["None"] * (len(book_list) - len(author_list)))
        formatted_list = zip(author_list, book_list)
        context = {"author_list": author_list, "book_list": book_list, "nb_authors": nb_authors, "nb_books": nb_books,
                   "formatted_list": formatted_list}
        return render(request, 'bookshelv/author_list.html', context)


def myurl_function(request, **kwargs):
    # q = request.GET.__getitem__('q')
    books = [book.title for book in Book.objects.filter(title__icontains=q)]
    return HttpResponse(json.dumps(books))


def add_book(request):
    if request.method == "POST":
        form = AddBookForm(request.POST)
        if form.is_valid():
            new_book = Book.objects.create(title=form.cleaned_data["title"], id=len(Book.objects.all()),
                                           format=form.cleaned_data["ebook"], mark=form.cleaned_data["mark"],
                                           type=form.cleaned_data["type"], date_end_reading=datetime.date.today())
            new_book.save()
            author_lastname, author_firstname = map(lambda x: x.strip(), form.cleaned_data["author"].split(","))
            author_object = Author.objects.filter(firstname__iexact=author_firstname, lastname__iexact=author_lastname)
            if len(author_object) == 1:
                author_id = author_object[0].id
            else:
                author_id = Author.objects.aggregate(Max("id"))
                new_author = Author.objects.create(firstname=author_firstname, lastname=author_lastname,
                                                   id=author_id + 1)
                new_author.save()
            base_object = Base.objects.create(id=len(Base.objects.all()) + 1, author_id=author_id, book_id=new_book.id)
            base_object.save()
            context = {"title": new_book.title}
            return render(request, "bookshelv/validation.html", context)
    else:
        form = AddBookForm()
        return render(request, 'bookshelv/add_book.html', {'form': form})
