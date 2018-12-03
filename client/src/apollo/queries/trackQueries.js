import gql from 'graphql-tag'

export const GET_TRACKS = gql`
  {
    tracks {
      id
      service
      media_url
      media_query_url
      title
      artist
      album
      year
      album_art_url
    }
  }
`
