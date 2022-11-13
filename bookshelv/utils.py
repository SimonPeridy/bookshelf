import re

from django.db.models import Func
import requests
from bs4 import BeautifulSoup as bs
from loguru import logger
from typing import List, Union


class Round2(Func):
    function = "ROUND"
    template = "%(function)s(%(expressions)s::numeric, 2)"


def get_page(base_url: str, data: dict) -> requests.Response:
    try:
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36"
        }
        r = requests.get(base_url, headers=headers, params=data)
    except:
        r = None
    return r


def get_cover_address(*args) -> str:
    """
    Function returning the first cover associated to the book on Goodreads
    :param book_title: the title of the book
    :return: the address of the cover picture
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
    # returns the address of the picture's cover of the first goodreads result for the book
    logger.info(f"Book cover is {cover_address}")
    return cover_address


#### google books api
API_KEY = "AIzaSyD5MJGgqaVeZksjaE6qQX-qh2_CeV5VEtE"
BOOK_SEARCH_URL = "https://www.googleapis.com/books/v1/volumes?"


def search_book(
    title: str,
    author: str = None,
    publisher: str = None,
    subject: Union[List[str], str] = None,
    isbn: str = None,
):
    if isbn is not None:
        if len(isbn) in (10, 13):
            return requests.get(BOOK_SEARCH_URL, {"q=isbn:" + isbn})
        logger.info(f"ISBN length is {isbn} while it should be 10 or 13.")
    search_string = "q=" + title
    if author is not None:
        search_string += "+inauthor:" + author
    if publisher is not None:
        search_string += "+inpublisher:" + publisher
    if subject is not None:
        subject = list(subject) if isinstance(subject, str) else subject
        search_string += "".join("+subject:" + keyword for keyword in subject)
    return requests.get(BOOK_SEARCH_URL + search_string)


def get_the_book(
    title: str,
    author: str = None,
    publisher: str = None,
    subject: Union[List[str], str] = None,
    isbn: str = None,
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
