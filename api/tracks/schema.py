import graphene
from graphene_django import DjangoObjectType

from .models import Track, Like
from users.schema import UserType

class TrackType(DjangoObjectType):
    class Meta:
        model = Track

class LikeType(DjangoObjectType):
    class Meta:
        model = Like


class Query(graphene.ObjectType):
    tracks = graphene.List(TrackType)
    likes = graphene.List(LikeType)

    def resolve_tracks(self, info, **kwargs):
        return Track.objects.all()

    def resolve_likes(self, info, **kwargs):
        return Like.objects.all()


class CreateTrack(graphene.Mutation):
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
    user = graphene.Field(UserType)

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
        user = info.context.user or None

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
            album_art_origin=album_art_origin
            user=user)
        # track.get_image_from_url(album_art_origin)
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



class CreateLike(graphene.Mutation):
    user = graphene.Field(UserType)
    track = graphene.Field(TrackType)

    class Arguments:
        track_id = graphene.Int()

    def mutate(self, info, track_id):
        user = info.context.user
        if user.is_anonymous:
            raise Exception("You must be logged in to do that")

        track = Track.objects.filter(id=track_id).first()
        if not track:
            raise Exception("Invalid track")

        Like.objects.create(
            user=user,
            track=track
        )

        return CreateLike(user=user, like=like)


class Mutation(graphene.ObjectType):
    create_track = CreateTrack.Field()
    create_like = CreateLike.Field()
