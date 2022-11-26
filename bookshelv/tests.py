from datetime import date

from django.test import TestCase

from Bibliotheque.wsgi import *
from bookshelv.models import *
from bookshelv.views import *

# on lance les tests avec prp manage.py test


class BookAddingTestCase(TestCase):
    def setUp(self):
        b1_id = Book.objects.create(
            title="Harry Potter et la chambre des secrets",
            is_ebook=0,
            book_type=0,
            series="serie1",
            series_number=2,
            mark=1,
            date_end_reading="2022-01-01",
            reading_state="read",
            language="french",
        ).id
        b2_id = Book.objects.create(
            title="Harry Potter à l'école des sorciers",
            is_ebook=0,
            book_type=0,
            series="serie1",
            series_number=1,
            mark=2,
            date_end_reading="2022-01-02",
            reading_state="read",
            language="french",
        ).id
        b3_id = Book.objects.create(
            title="1984",
            is_ebook=0,
            book_type=0,
            series=None,
            series_number=None,
            mark=7,
            date_end_reading="2022-08-02",
            reading_state="read",
            language="french",
        ).id
        b4_id = Book.objects.create(
            title="Maléfices",
            is_ebook=1,
            book_type=0,
            series="La trilogie du mal",
            series_number=2,
            mark=8,
            date_end_reading="2022-11-02",
            reading_state="read",
            language="french",
        ).id
        b5_id = Book.objects.create(
            title="Du sang sur la glace",
            is_ebook=0,
            book_type=0,
            series=None,
            series_number=None,
            mark=5,
            date_end_reading="2022-01-12",
            reading_state="to be read",
            language="french",
        ).id
        b6_id = Book.objects.create(
            title="One Piece",
            is_ebook=0,
            book_type=2,
            series=None,
            series_number=None,
            mark=9,
            date_end_reading=None,
            reading_state="reading",
            language="english",
        ).id
        b7_id = Book.objects.create(
            title="La maison des voix",
            is_ebook=1,
            book_type=0,
            series=None,
            series_number=None,
            mark=7,
            date_end_reading="2021-01-02",
            reading_state="read",
            language="french",
        ).id
        a1_id = Author.objects.create(lastname="Rowling", firstname="J.K.").id
        WrittenBy.objects.create(book_id=b1_id, author_id=a1_id)
        WrittenBy.objects.create(book_id=b2_id, author_id=a1_id)
        a2_id = Author.objects.create(lastname="Carrisi", firstname="Donato").id
        WrittenBy.objects.create(book_id=b7_id, author_id=a2_id)
        a3_id = Author.objects.create(lastname="Oda", firstname="Eiichiro").id
        WrittenBy.objects.create(book_id=b6_id, author_id=a3_id)
        a4_id = Author.objects.create(lastname="Nesbø", firstname="Jo").id
        WrittenBy.objects.create(book_id=b5_id, author_id=a4_id)
        a5_id = Author.objects.create(lastname="Chattam", firstname="Maxime").id
        WrittenBy.objects.create(book_id=b4_id, author_id=a5_id)
        a6_id = Author.objects.create(lastname="Orwell", firstname="Georges").id
        WrittenBy.objects.create(book_id=b3_id, author_id=a6_id)

    def test_get_search_result_all(self):
        result = get_search_result(author_name="", book_name="")
        assert len(result[0]) == 6
        assert len(result[1]) == 7
        assert all(isinstance(result[0][i], Author) for i in range(len(result[0])))
        assert all(isinstance(result[1][i], Book) for i in range(len(result[1])))

    def test_get_search_result_sample_author(self):
        result = get_search_result(author_name="rowl", book_name="")
        assert len(result[0]) == 1
        assert len(result[1]) == 2
        assert result[0][0] == Author(firstname="J.K.", lastname="Rowling")

    def test_get_search_result_sample_book(self):
        result = get_search_result(author_name="", book_name="piec")
        assert len(result[0]) == 1
        assert len(result[1]) == 1
        assert result[0][0] == Author(firstname="Eiichiro", lastname="Oda")
        assert result[1][0].title == "One Piece"

    def test_get_search_result_sample_both(self):
        result = get_search_result(author_name="a", book_name="a")
        assert len(result[0]) == 2
        assert len(result[1]) == 2
        assert result[0][0] == Author(firstname="Donato", lastname="Carrisi")
        assert result[0][1] == Author(firstname="Maxime", lastname="Chattam")
        assert result[1][0].title == "La maison des voix"
        assert result[1][1].title == "Maléfices"

    def test_get_search_result_empty_return(self):
        result = get_search_result(author_name="jvhfbedj", book_name="aebf")
        assert len(result[0]) == 0
        assert len(result[1]) == 0

    def test_get_all_authors(self):
        result = get_all_authors()
        assert len(result) == 6
        authors = (
            ("Carrisi", "Donato"),
            ("Chattam", "Maxime"),
            ("Nesbø", "Jo"),
            ("Oda", "Eiichiro"),
            ("Orwell", "Georges"),
            ("Rowling", "J.K."),
        )
        assert all(
            result[i] == f"{authors[i][0]}, {authors[i][1]}" for i in range(len(result))
        )

    def test_adding_book_new_book(self):
        cleaned_data = {
            "title": "Harry Potter 3",
            "author_firstname": "J.K.",
            "author_lastname": "Rowling",
            "series": "Harry Potter",
            "series_number": 3,
            "is_ebook": True,
            "book_type": 0,
            "language": "french",
            "mark": 4,
            "reading_state": "read",
        }
        author, book, modification = adding_book(cleaned_data)
        assert author.firstname == "J.K."
        assert author.lastname == "Rowling"
        assert book.title == "Harry Potter 3"
        assert book.series_number == 3
        assert book.series == "Harry Potter"
        assert book.mark == 4
        assert book.reading_state == "read"
        assert book.language == "french"
        assert book.is_ebook == True
        assert book.book_type == 0
        assert book.date_end_reading == date.today()
        assert modification == "BOOK_ADDED"
        assert Book.objects.filter(
            title="Harry Potter 3",
            series_number=3,
            series="Harry Potter",
            mark=4,
            reading_state="read",
            language="french",
            is_ebook=True,
            book_type=0,
        ).exists()
        assert WrittenBy.objects.filter(
            book_id=book.id,
            author_id=Author.objects.get(firstname="J.K.", lastname="Rowling"),
        )

    def test_adding_book_new_book_new_author(self):
        cleaned_data = {
            "title": "Le petit Prince",
            "author_firstname": "Antoine",
            "author_lastname": "de Saint-Exupéry",
            "series": None,
            "series_number": None,
            "is_ebook": False,
            "book_type": 0,
            "language": "french",
            "mark": 7,
            "reading_state": "reading",
        }
        author, book, modification = adding_book(cleaned_data)
        assert author.firstname == "Antoine"
        assert author.lastname == "de Saint-Exupéry"
        assert book.title == "Le petit Prince"
        assert book.series_number == None
        assert book.series == None
        assert book.mark == 7
        assert book.reading_state == "reading"
        assert book.language == "french"
        assert book.is_ebook == False
        assert book.book_type == 0
        assert book.date_end_reading == None
        assert modification == "BOOK_ADDED"
        assert Book.objects.filter(
            title="Le petit Prince",
            series_number=None,
            series=None,
            mark=7,
            reading_state="reading",
            language="french",
            is_ebook=False,
            book_type=0,
        ).exists()
        assert WrittenBy.objects.filter(
            book_id=book.id,
            author_id=Author.objects.get(
                firstname="Antoine", lastname="de Saint-Exupéry"
            ),
        )

    def test_adding_book_update_book(self):
        cleaned_data = {
            "title": "One Piece",
            "author_firstname": "Eiichiro",
            "author_lastname": "Oda",
            "series": None,
            "series_number": None,
            "is_ebook": 0,
            "book_type": 2,
            "language": "english",
            "mark": 9,
            "reading_state": "read",
        }
        author, book, modification = adding_book(cleaned_data)
        assert author.firstname == "Eiichiro"
        assert author.lastname == "Oda"
        assert book.title == "One Piece"
        assert book.series_number == None
        assert book.series == None
        assert book.mark == 9
        assert book.reading_state == "read"
        assert book.language == "english"
        assert book.is_ebook == False
        assert book.book_type == 2
        assert book.date_end_reading == date.today()
        assert modification == "BOOK_MODIFIED"
        assert Book.objects.filter(
            title="One Piece",
            series_number=None,
            series=None,
            mark=9,
            reading_state="read",
            language="english",
            is_ebook=False,
            book_type=2,
        ).exists()
        assert WrittenBy.objects.filter(
            book_id=book.id,
            author_id=Author.objects.get(firstname="Eiichiro", lastname="Oda"),
        )

    def test_get_search_result_nothing(self):
        list_author_expected = Author.objects.all()
        list_books_expected = Book.objects.all()
        list_author, list_books = get_search_result(author_name="", book_name="")
        assert len(list_author) == len(list_author_expected)
        assert all(
            list_author[i] == list_author_expected[i] for i in range(len(list_author))
        )
        assert len(list_books) == len(list_books_expected)
        assert all(
            list_books[i] == list_books_expected[i] for i in range(len(list_books))
        )

    def test_get_search_result_one_author(self):
        list_author_expected = Author.objects.filter(
            firstname="J.K.", lastname="Rowling"
        )
        list_books_expected = Book.objects.filter(title__contains="Harry Potter")
        list_author, list_books = get_search_result(author_name="rowl", book_name="")
        assert len(list_author) == len(list_author_expected)
        assert all(
            list_author[i] == list_author_expected[i] for i in range(len(list_author))
        )
        assert len(list_books) == len(list_books_expected)
        assert all(
            list_books[i] == list_books_expected[i] for i in range(len(list_books))
        )

    def test_get_search_result_one_book(self):
        list_author_expected = Author.objects.filter(
            firstname="Eiichiro", lastname="Oda"
        )
        list_books_expected = Book.objects.filter(title__icontains="piece")
        list_author, list_books = get_search_result(author_name="", book_name="piece")
        assert len(list_author) == len(list_author_expected)
        assert all(
            list_author[i] == list_author_expected[i] for i in range(len(list_author))
        )
        assert len(list_books) == len(list_books_expected)
        assert all(
            list_books[i] == list_books_expected[i] for i in range(len(list_books))
        )

    def test_get_search_result_book_author(self):
        list_author_expected = Author.objects.filter(
            firstname="J.K.", lastname="Rowling"
        )
        list_books_expected = Book.objects.filter(title__icontains="secret")
        list_author, list_books = get_search_result(
            author_name="rowl", book_name="secr"
        )
        assert len(list_author) == len(list_author_expected)
        assert all(
            list_author[i] == list_author_expected[i] for i in range(len(list_author))
        )
        assert len(list_books) == len(list_books_expected)
        assert all(
            list_books[i] == list_books_expected[i] for i in range(len(list_books))
        )

    def test_get_search_result_books_authors(self):
        list_author_expected = Author.objects.filter(
            Q(lastname="Carrisi") | Q(lastname="Rowling")
        )
        list_books_expected = Book.objects.filter(
            Q(title="La maison des voix")
            | Q(title="Harry Potter et la chambre des secrets")
        )
        list_authors, list_books = get_search_result(author_name="i", book_name="la")
        assert len(list_authors) == len(list_author_expected)
        assert all(
            list_authors[i] == list_author_expected[i] for i in range(len(list_authors))
        )
        assert len(list_books) == len(list_books_expected)
        assert all(
            list_books[i] == list_books_expected[i] for i in range(len(list_books))
        )
