import gql from 'graphql-tag'
import { graphql } from 'react-apollo'
import compose from 'recompose/compose'

const GET_CURRENT_TRACK = gql`
  query getCurrentTrack {
    currentTrack @client
  }
`
const SET_CURRENT_TRACK = gql`
  mutation setCurrentTrack($track: String) {
    setCurrentTrack(track: $track) @client
  }
`

const CLEAR_CURRENT_TRACK = gql`
  mutation clearCurrentTrack {
    clearCurrentTrack @client
  }
`

const setCurrentTrack = (_obj, { track }, { cache }) => {
  const query = GET_CURRENT_TRACK
  const { currentTrack } = cache.readQuery({ query })
  cache.writeQuery({ query, data: { currentTrack: track }})

  console.log({ currentTrack })

  return null
}

const clearCurrentTrack = (_obj, _args, { cache }) => {
  cache.writeQuery({ query: GET_CURRENT_TRACK, data: null })

  return null
}

const currentTrackHandler = {
  props: ({ ownProps, data: { currentTrack = null}}) => ({
    ...ownProps,
    currentTrack
  })
}

const withCurrentTrack = compose(
  graphql(GET_CURRENT_TRACK, currentTrackHandler),
  graphql(SET_CURRENT_TRACK, { name: 'setCurrentTrackMutation'}),
  graphql(CLEAR_CURRENT_TRACK, { name: 'clearCurrentTrackMutation'})
)

const store = {
  defaults: {
    currentTrack: null
  },
  mutations: {
    setCurrentTrack,
    clearCurrentTrack
  }
}

export {
  store,
  withCurrentTrack
}
