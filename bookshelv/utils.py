"""Utility functions."""

from __future__ import annotations

import re
from typing import TYPE_CHECKING, Optional, Union

import requests
from bs4 import BeautifulSoup as bs
from django.db.models import Func
from loguru import logger

from .models import Book

if TYPE_CHECKING:
    from collections.abc import Iterable


class Round2(Func):
    """Class to round floats to two decimals.

    Args:
        Func (_type_): _description_

    """

    function = "ROUND"
    template = "%(function)s(%(expressions)s::numeric, 2)"


def get_page(base_url: str, data: dict) -> requests.Response:
    """Create an agent to query another url.

    To be revised.

    Args:
        base_url (str): url to query
        data (dict): data to add to the url

    Returns:
        requests.Response: response from the url

    """
    try:
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36",
        }
        r = requests.get(base_url, headers=headers, params=data, timeout=10)
    except:
        r = None
    return r


def get_cover_address(*args: Iterable[str]) -> str:
    """Get the address of a cover of the book which infos are furnished in the args.

    Argument is a list containing the title of the book, the author and the series name.
    All informations are furnished to be sure to get the good cover.

    Returns:
        str: address of the cover of the book

    """
    data = {"q": " ".join(args)}
    book_url = get_page("https://www.goodreads.com/search", data)
    soup = bs(book_url.text, "html.parser")
    # books = soup.findAll("tr", attrs={"itemtype": "http://schema.org/Book"})
    # for book in books:
    #     print(next(int(i) for i in book.find("span", attrs={"class":"greyText smallText uitext"}).contents[2].split() if i.isdigit()))
    try:
        cover_address = soup.find("img", attrs={"class": "bookCover"})["src"]
        cover_address = re.sub(r"\._SX\d*_", r"", cover_address)
        cover_address = re.sub(r"\._SY\d*_", r"", cover_address)
    except TypeError:
        logger.warning(f"No cover found for this books {args}")
        cover_address = None
    # returns the address of the picture's cover of the first goodreads result
    # for the book
    logger.info(f"Book cover is {cover_address}")
    return cover_address


#### google books api
API_KEY = "AIzaSyD5MJGgqaVeZksjaE6qQX-qh2_CeV5VEtE"
BOOK_SEARCH_URL = "https://www.googleapis.com/books/v1/volumes?"


def get_all_titles() -> str:
    """Get all the titles of the books.

    Returns:
        Str: all the titles of the books read separated by a space

    """
    return " ".join(Book.objects.all().values_list("title", flat=True))


def to_tuple(lst: Iterable) -> tuple:
    """Transform an Itrerable in a list.

    Not great, maybe need to be revised.

    Args:
        lst (Iterable): iterable to transform

    Returns:
        tuple: new iterable as a tuple

    """
    return tuple(to_tuple(i) if isinstance(i, list) else i for i in lst)


####################
# study to get books from google api and use isbn and stuff like that
####################


def search_book(
    title: str,
    author: str | None = None,
    publisher: str | None = None,
    subject: list[str] | str | None = None,
    isbn: str | None = None,
) -> requests.Response:
    if isbn is not None:
        if len(isbn) in (10, 13):
            return requests.get(BOOK_SEARCH_URL, {"q=isbn:" + isbn}, timeout=10)
        logger.info(f"ISBN length is {isbn} while it should be 10 or 13.")
    search_string = "q=" + title
    if author is not None:
        search_string += "+inauthor:" + author
    if publisher is not None:
        search_string += "+inpublisher:" + publisher
    if subject is not None:
        subject = list(subject) if isinstance(subject, str) else subject
        search_string += "".join("+subject:" + keyword for keyword in subject)
    return requests.get(BOOK_SEARCH_URL + search_string, timeout=10)


def get_the_book(
    title: str,
    author: str | None = None,
    publisher: str | None = None,
    subject: list[str] | str | None = None,
    isbn: str | None = None,
) -> dict:
    try:
        books_request = search_book(title, author, publisher, subject, isbn)
        books_request.raise_for_status()
    except requests.exceptions.HTTPError as err:
        logger.info(f"Error while requesting the book : {books_request.status_code}.")
        logger.info(err)
        raise SystemExit(err)  # TODO gérer l'erreur pour que le site ne plante pas
    books_info = books_request.json()["items"][0]["volumeInfo"]
    # on récupère l'isbn le plus long de la liste pour avoir l'isbn13 s'il existe, l'isbn10 autrement
    isbn = sorted(
        (e["identifier"] for e in books_info["industryIdentifiers"]),
        key=lambda x: len(x),
        reverse=True,
    )[0]
    return {
        "title": books_info["title"],
        "authors": books_info["authors"][
            0
        ],  # always the first author atm, maybe make it match if there is several authors later
        "isbn": isbn,
    }
