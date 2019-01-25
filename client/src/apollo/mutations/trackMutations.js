import gql from 'graphql-tag'

export const NEW_TRACK_MUTATION = gql`
  mutation NewTrackMutation($url: String!) {
    new_track(url: $url) {
      url
      service
      mediaUrl
      mediaQueryUrl
      mediaType
      title
      artist
      album
      year
      albumArtOrigin
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
        mediaType: $mediaType,
        mediaUrl: $mediaUrl,
        mediaQueryUrl: $mediaQueryUrl,
        title: $title,
        artist: $artist,
        album: $album,
        year: $year,
        albumArtOrigin: $albumArtOrigin
      ) {
          url
        }
    }
`
