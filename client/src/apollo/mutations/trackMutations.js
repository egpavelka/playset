import gql from 'graphql-tag'

export const NEW_TRACK_MUTATION = gql`
  mutation NewTrackMutation($url: String!) {
    new_track(url: $url) {
      url
      service
      media_url
      media_query_url
      media_type
      title
      artist
      album
      year
      album_art_origin
    }
  }
`
export const CREATE_TRACK_MUTATION = gql`
  mutation CreateTrackMutation(
    $url: String!,
    $service: String!,
    $mediaUrl: String,
    $mediaQueryUrl: String,
    $mediaType: String!,
    $title: String!
    $artist: String!,
    $album: String,
    $year: String,
    $albumArtOrigin: String) {
      create_track(
        url: $url,
        service: $service,
        media_type: $mediaType,
        media_url: $mediaUrl,
        media_query_url: $mediaQueryUrl,
        title: $title,
        artist: $artist,
        album: $album,
        year: $year,
        album_art_origin: $albumArtOrigin
      ) {
          url
        }
    }
`
