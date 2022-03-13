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
    path('add_book/get_series/', views.get_series, name='get_series')
]
