from django.urls import path, re_path
from django.views.generic import RedirectView

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("add_book/", views.add_book, name="add_book"),
    path(
        "author_list/",
        view=views.search,
        name="author_list",
    ),
    path(
        "search/",
        view=views.search_json,
        name="search",
    ),
    path("series_entry/", views.series_entry, name="series_entry"),
    # path("search_book/", views.search_book, name="search_book"),
    path("series_entry/series_list", views.series_list, name="series_list"),
    path("add_book/get_authors/", views.get_authors, name="get_authors"),
    path("add_book/get_series/", views.get_series, name="get_series"),
    path(
        "author-bar-chart/",
        views.small_author_bar_chart_view,
        name="small_author_bar_chart",
    ),
    path(
        "best-author-bar-chart/",
        views.best_author_bar_chart_view,
        name="best_author_bar_chart",
    ),
    path(
        "book-by-language-by-year-chart/",
        views.book_by_language_by_year_chart_view,
        name="book_by_language_by_year_chart",
    ),
    path("category-pie-chart/", views.category_chart, name="category_pie_chart"),
    path("charts/", views.display_charting_page, name="charts"),
    path("wordcloud/", views.create_wordcloud, name="wordcloud"),
    path(
        "author_list/books/get_books",
        views.get_books,
        name="books",
    ),
]
