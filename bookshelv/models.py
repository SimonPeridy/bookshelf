# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

MAX_LENGTH = 9999


class Author(models.Model):
    id = models.IntegerField(blank=False, null=False, primary_key=True)
    firstname = models.CharField(max_length=MAX_LENGTH)
    lastname = models.CharField(max_length=MAX_LENGTH)

    def __str__(self):
        return self.firstname + " " + self.lastname

    class Meta:
        managed = False
        db_table = 'author'


class Book(models.Model):
    id = models.IntegerField(blank=False, null=False, primary_key=True)
    title = models.CharField(max_length=MAX_LENGTH)
    format = models.IntegerField(blank=True, null=True)
    mark = models.IntegerField(blank=True, null=True)
    type = models.IntegerField(blank=True, null=True)
    date_end_reading = models.DateField(blank=True, null=True)

    def __str__(self):
        return self.title

    class Meta:
        managed = False
        db_table = 'book'


class Owner(models.Model):
    id = models.IntegerField(blank=False, null=False, primary_key=True)
    name = models.CharField(unique=True, max_length=MAX_LENGTH)

    class Meta:
        managed = False
        db_table = 'owner'


class Base(models.Model):
    id = models.IntegerField(blank=False, null=False, primary_key=True)
    owner = models.ForeignKey(Owner, models.DO_NOTHING, blank=True, null=True)
    author = models.ForeignKey(Author, models.DO_NOTHING)
    book = models.OneToOneField(Book, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'base'
        unique_together = (('book_id', 'author_id'),)
