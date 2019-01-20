import gql from 'graphql-tag'

export const GET_TRACKS = gql`
  {
    tracks {
      id
      service
      mediaUrl
      mediaQueryUrl
      title
      artist
      album
      year
    }
  }
`
