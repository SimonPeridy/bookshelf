import re

from django.db.models import Func
import requests
from bs4 import BeautifulSoup as bs
from loguru import logger


class Round2(Func):
    function = "ROUND"
    template = "%(function)s(%(expressions)s::numeric, 2)"


def get_page(base_url, data):
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'}
        r = requests.get(base_url, headers=headers, params=data)
    except:
        r = None
    return r


def get_cover_address(book_title: str) -> str:
    """
    Function returning the first cover associated to the book on Goodreads
    :param book_title: the title of the book
    :return: the address of the cover picture
    """
    data = {"q": book_title}
    book_url = get_page("https://www.goodreads.com/search", data)
    soup = bs(book_url.text, 'html.parser')
    # books = soup.findAll("tr", attrs={"itemtype": "http://schema.org/Book"})
    # for book in books:
    #     print(next(int(i) for i in book.find("span", attrs={"class":"greyText smallText uitext"}).contents[2].split() if i.isdigit()))
    cover_address = soup.find("img", attrs={"class": "bookCover"})["src"]
    cover_address = re.sub(r'\._SX\d*_', r"", cover_address)
    # returns the address of the picture's cover of the first goodreads result for the book
    logger.info(f"Book cover is {cover_address}")
    return cover_address
