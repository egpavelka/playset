from django.db import models
from django.conf import settings

# from django.core.files import file
from os.path import basename
from urllib.request import urlretrieve, urlcleanup
from urllib.parse import urlsplit

DEFAULT_USER_ID = 1

class Track(models.Model):
    url = models.URLField(default='')
    media_url = models.URLField(null=True)
    media_query_url = models.URLField(null=True)
    service = models.CharField(max_length=20, default='')
    media_type = models.CharField(max_length=20, default='audio')
    title = models.CharField(max_length=200, default='')
    artist = models.CharField(max_length=200, default='')
    album = models.CharField(max_length=200, null=True)
    year = models.CharField(max_length=4, null=True)
    album_art_origin = models.URLField(null=True)
    album_art = models.ImageField(null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, default=DEFAULT_USER_ID)
    created_at = models.DateTimeField(auto_now_add=True)


class Like(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, default=DEFAULT_USER_ID)
    track = models.ForeignKey('tracks.Track', related_name='likes', on_delete=models.CASCADE)
