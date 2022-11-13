from django import forms
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

from bookshelv.utils import get_the_book


class AddBookForm(forms.Form):
    type_list = (
        (0, "Roman"),
        (1, "Documentaire"),
        (2, "Manga"),
        (3, "Théâtre"),
        (4, "Poésie"),
    )
    type = forms.ChoiceField(
        label="Type de document", choices=type_list, widget=forms.RadioSelect, initial=0
    )
    reading_state_list = (
        ("reading", "Lecture en cours"),
        ("to be read", "Prochaine lecture"),
        ("read", "Lu"),
    )
    reading_state = forms.ChoiceField(
        label="Statut de la lecture",
        choices=reading_state_list,
        widget=forms.RadioSelect,
        initial="read",
    )
    ebook = forms.BooleanField(label="Format électronique", required=False)
    title = forms.CharField(label="Titre")
    author = forms.CharField(label="Auteur")
    mark_list = ((i, i) for i in range(1, 11))
    mark = forms.ChoiceField(label="Note", choices=mark_list)
    language_list = (("french", "Français"), ("english", "Anglais"))
    language = forms.ChoiceField(
        label="Langue", choices=language_list, widget=forms.Select
    )
    series = forms.CharField(label="Série", required=False)
    series_number = forms.IntegerField(label="Numéro", min_value=1, required=False)

    def clean(self):
        cleaned_data = super().clean()
        title = cleaned_data["title"]
        author_lastname, author_firstname = map(
            lambda x: x.strip(), cleaned_data["author"].split(",")
        )
        book = get_the_book(title=title, author=author_lastname)
        if (
            book["title"].lower() != title.lower()
            or author_lastname not in book["author"]
            or author_firstname not in book["author"]
        ):
            raise ValidationError(
                _(
                    "Ce livre n'est pas reconnu, peut être que vous cherchez %(title)s de %(author)s"
                ),
                code="invalid",
                params={"title": book["title"], "author": book["author"]},
            )
