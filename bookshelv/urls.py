from django.urls import path, re_path
from django.views.generic import RedirectView

from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('add_book/', views.add_book, name='add_book'),
    path('author_list/', views.search, name='author_list'),
    path('add_book/get_authors/', views.get_authors, name='get_authors')
]
