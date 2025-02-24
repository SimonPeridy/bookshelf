"""Django models."""

from django.db import models
from loguru import logger


class Author(models.Model):
    """Author model.

    Conatains all the info needed about an author.
    """

    firstname = models.CharField(max_length=150)
    lastname = models.CharField(max_length=150)

    class Meta:
        """Meta information about the model."""

        get_latest_by = "id"
        managed = True
        db_table = "author"
        ordering = [
            models.F("lastname").asc(nulls_last=True),
            models.F("firstname").asc(nulls_last=True),
            "id",
        ]

    def __str__(self) -> str:
        """Display an author as a string.

        Returns:
            str: author formatted as a string

        """
        if self.firstname == "":
            return self.lastname
        if self.lastname == "":
            return self.firstname
        return f"{self.lastname}, {self.firstname}"

    def __eq__(self, author: object) -> bool:
        """Equality test between two objects.

        Args:
            author (Self): object to test equality with

        Returns:
            bool: True if equal, else False

        """
        if isinstance(author, self.__class__):
            return (
                self.firstname == author.firstname and self.lastname == author.lastname
            )
        logger.warning(
            "You are comparing an author with an object of a differenct class.",
        )
        return False

    def __repr__(self) -> str:
        """Display an author as a string, for debugging.

        Returns:
            str: author formatted as a string

        """
        return (
            f"{self.__class__.__name__}("
            + ", ".join(
                (f"{attr_name}={getattr(self, attr_name)}")
                for attr_name in vars(self)
                if not attr_name.startswith("_")
            )
            + ")"
        )


class WrittenBy(models.Model):
    """Model linking an author and a book."""

    author = models.ForeignKey("Author", models.DO_NOTHING)
    book = models.ForeignKey("Book", models.DO_NOTHING)

    class Meta:
        """Meat informations about the model."""

        managed = True
        db_table = "written_by"
        constraints = [
            models.UniqueConstraint(
                fields=["author_id", "book_id"],
                name="unique_book_id_author_id_combination",
            ),
        ]
        get_latest_by = "book_id"

    def __str__(self) -> str:
        """Display a WrittenBy object as a string.

        Returns:
            str: WrittenBy object formatted as a string

        """
        return f"Author : {self.author}, Book : {self.book}"

    def __repr__(self) -> str:
        """Display a WrittenBy object as a string, for debugging.

        Returns:
            str: WrittenBy object formatted as a string

        """
        return (
            f"{self.__class__.__name__}("
            + ", ".join(
                (f"{attr_name}={getattr(self, attr_name)}")
                for attr_name in vars(self)
                if not attr_name.startswith("_")
            )
            + ")"
        )


class Book(models.Model):
    title = models.CharField(max_length=150)
    is_ebook = models.IntegerField(blank=True, null=True)
    BOOK_TYPE_LIST = (
        (0, "Roman"),
        (1, "Documentaire"),
        (2, "Manga"),
        (3, "Théâtre"),
        (4, "Poésie"),
    )
    book_type = models.IntegerField(blank=True, null=True, choices=BOOK_TYPE_LIST)
    series = models.CharField(max_length=150, blank=True, null=True)
    language = models.CharField(max_length=150, blank=True, null=True)
    series_number = models.IntegerField(blank=True, null=True)
    READING_STATE_CHOICES = (
        ("read", "Lu"),
        ("reading", "Lecture en cours"),
        ("to be read", "Prochaine lecture"),
    )
    reading_state = models.CharField(
        max_length=150,
        choices=READING_STATE_CHOICES,
        default=READING_STATE_CHOICES[0][0],
    )
    mark = models.IntegerField(blank=True, null=True)
    date_end_reading = models.DateField(blank=True, null=True)

    class Meta:
        """Meta informations about the model."""

        managed = True
        db_table = "book"
        get_latest_by = "date_end_reading"
        ordering = [
            "title",
            "series",
        ]

    def __str__(self) -> str:
        """Display a book as a string.

        Returns:
            str: book formatted as a string

        """
        if self.reading_state == "read":
            title = f"{self.title}"
            if self.mark:
                title += f" (noté {self.mark}/10)"
        elif self.reading_state == "reading":
            title = f"<i>{self.title}</i>"
            if self.book_type == 2:  # test if it's a manga
                title += f" <i>(chapter {self.series_number})<i/>"
        else:
            title = f"<u>{self.title}</u>"
        if self.series is not None:
            return f"{title} <i>({self.series} {self.series_number})</i>"
        return title

    def __repr__(self) -> str:
        """Display a book object as a string, for debugging.

        Returns:
            str: book object formatted as a string

        """
        return (
            f"{self.__class__.__name__}("
            + ", ".join(
                (f"{attr_name}={getattr(self, attr_name)}")
                for attr_name in vars(self)
                if not attr_name.startswith("_")
            )
            + ")"
        )

    def __eq__(self, book: object) -> bool:
        """Equality tests between two books.

        Args:
            book (Self): book to test equality with

        Returns:
            bool: True if the books are the same, else False

        """
        if isinstance(book, self.__class__):
            equality_attibutes = (
                "title",
                "book_type",
                "series",
                "series_number",
                "language",
            )
            return all(
                getattr(self, attr) == getattr(book, attr)
                for attr in equality_attibutes
            )
        logger.warning("You are comparing a book with an object of a differenct class.")
        return False
