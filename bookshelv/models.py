# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from loguru import logger


class Author(models.Model):
    firstname = models.CharField(max_length=150)
    lastname = models.CharField(max_length=150)

    def __str__(self):
        return f"{self.lastname}, {self.firstname}"

    def __eq__(self, author) -> bool:
        if isinstance(author, self.__class__):
            return (
                self.firstname == author.firstname and self.lastname == author.lastname
            )
        logger.warning(
            "You are comparing an author with an object of a differenct class."
        )
        return False

    def __repr__(self) -> str:
        return (
            f"{self.__class__.__name__}("
            + ", ".join(
                (f"{attr_name}={getattr(self, attr_name)}")
                for attr_name in vars(self)
                if not attr_name.startswith("_")
            )
            + ")"
        )

    class Meta:
        get_latest_by = "id"
        managed = True
        db_table = "author"
        ordering = [
            models.F("lastname").asc(nulls_last=True),
            models.F("firstname").asc(nulls_last=True),
            "id",
        ]


class WrittenBy(models.Model):
    author = models.ForeignKey("Author", models.DO_NOTHING)
    book = models.ForeignKey("Book", models.DO_NOTHING)

    def __str__(self) -> str:
        return f"Author : {self.author}, Book : {self.book}"

    def __repr__(self) -> str:
        return (
            f"{self.__class__.__name__}("
            + ", ".join(
                (f"{attr_name}={getattr(self, attr_name)}")
                for attr_name in vars(self)
                if not attr_name.startswith("_")
            )
            + ")"
        )

    class Meta:
        managed = True
        db_table = "written_by"
        constraints = [
            models.UniqueConstraint(
                fields=["author_id", "book_id"],
                name="unique_book_id_author_id_combination",
            )
        ]
        get_latest_by = "book_id"


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

    def __str__(self) -> str:
        if self.series is not None:
            return f"{self.title}, <i>({self.series} {self.series_number})</i>"
        return self.title

    class Meta:
        managed = True
        db_table = "book"
        get_latest_by = "date_end_reading"
        ordering = [
            "title",
            "series",
        ]

    def __repr__(self) -> str:
        return (
            f"{self.__class__.__name__}("
            + ", ".join(
                (f"{attr_name}={getattr(self, attr_name)}")
                for attr_name in vars(self)
                if not attr_name.startswith("_")
            )
            + ")"
        )

    def __eq__(self, book) -> bool:
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
        logger.warning(
            "You are comparing an book with an object of a differenct class."
        )
        return False
