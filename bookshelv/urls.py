from django.urls import path, re_path
from django.views.generic import RedirectView

from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('add_book/', views.add_book, name='add_book'),
    path('author_list/', views.search, name='author_list'),
    path('series_entry/', views.series_entry, name='series_entry'),
    path('series_entry/series_list', views.series_list, name='series_list'),
    path('add_book/get_authors/', views.get_authors, name='get_authors'),
    path('add_book/get_series/', views.get_series, name='get_series'),
    path('author-bar-chart/', views.small_author_bar_chart_view, name='small_author_bar_chart'),
    path('best-author-bar-chart/', views.best_author_bar_chart_view, name='best_author_bar_chart'),
    path('category-pie-chart/', views.category_chart, name='category_pie_chart'),
    path('charts/', views.display_charting_page, name='charts')
]
