import gql from 'graphql-tag'

export const GET_CURRENT_TRACK = gql`
  {
    tracks @client {
      id
      service
      media_url
      title
      artist
      album
      year
    }
    currentTrack @client
  }
`
