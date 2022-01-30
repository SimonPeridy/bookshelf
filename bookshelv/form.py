from django import forms


class AddBookForm(forms.Form):
    type_list = ((0, "Roman"), (1, "Documentaire"), (2, "Manga"), (3, "Théâtre"), (4, "Poésie"))
    type = forms.ChoiceField(label="Type de document", choices=type_list, widget=forms.RadioSelect, initial=0)
    ebook = forms.BooleanField(label="Format électronique", required=False)
    title = forms.CharField(label="Titre")
    author = forms.CharField(label="Auteur")
    mark_list = ((i, i) for i in range(1, 11))
    mark = forms.ChoiceField(label="Note", choices=mark_list)
