import graphene
from graphene_django import DjangoObjectType

from .models import Track

class TrackType(DjangoObjectType):
    class Meta:
        model = Track


class Query(graphene.ObjectType):
    tracks = graphene.List(TrackType)

    def resolve_tracks(self, info, **kwargs):
        return Track.objects.all()


class CreateTrack(graphene.Mutation):
    # track = graphene.Field(TrackType)
    id = graphene.Int()
    url = graphene.String(required=True)
    service = graphene.String(required=True)
    media_url = graphene.String()
    media_query_url = graphene.String()
    media_type = graphene.String(required=True)
    title = graphene.String()
    artist = graphene.String()
    album = graphene.String()
    year = graphene.String()
    album_art_origin = graphene.String()

    class Arguments:
        url = graphene.String(required=True)
        service = graphene.String(required=True)
        media_url = graphene.String()
        media_query_url = graphene.String()
        media_type = graphene.String(required=True)
        title = graphene.String()
        artist = graphene.String()
        album = graphene.String()
        year = graphene.String()
        album_art_origin = graphene.String()

    def mutate(self, info, url, service, media_url, media_query_url, media_type, title, artist, album, year, album_art_origin):
        track = Track(
            url=url,
            service=service,
            media_url=media_url,
            media_query_url=media_query_url,
            media_type=media_type,
            title=title,
            artist=artist,
            album=album,
            year=year,
            album_art_origin=album_art_origin)
        track.save()

        return CreateTrack(
            url=track.url,
            service=track.service,
            media_url=track.media_url,
            media_query_url=track.media_query_url,
            media_type=track.media_type,
            title=track.title,
            artist=track.artist,
            album=track.album,
            year=track.year,
            album_art_origin=track.album_art_origin)


class Mutation(graphene.ObjectType):
    create_track = CreateTrack.Field()
