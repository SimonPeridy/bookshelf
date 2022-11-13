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
            reading_state="read",
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

    def test_adding_book(self):
        # to be continued
        pass
