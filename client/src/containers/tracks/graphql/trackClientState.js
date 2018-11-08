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
export const SET_CURRENT_TRACK = gql``

export const CLEAR_CURRENT_TRACK = gql``

export const setCurrentTrack = (_obj, { item }, { cache }) => {
  cache.writeQuery({ query, data: { currentTrack: item} })
}

export const clearCurrentTrack = (_obj, { item }, { cache }) => {
  cache.writeQuery({ query, data: { currentTrack: null } })
}
