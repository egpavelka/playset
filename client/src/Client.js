import { ApolloClient } from 'apollo-client'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { HttpLink } from 'apollo-link-http'
// import { onError } from 'apollo-link-error'
import { withClientState } from 'apollo-link-state'
import { ApolloLink } from 'apollo-link'
// import { } from './containers/tracks/graphql/trackClientState'
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

const cache = new InMemoryCache()

const httpLink = new HttpLink({
  uri: 'http://localhost:5100/graphql',
  credentials: 'same-origin'
})

const stateLink = withClientState({
  cache,
  defaults: {
    currentTrack: null
  },
  resolvers: {
    Mutation: {
      setCurrentTrack,
      clearCurrentTrack
    }
  }
})

const Client = new ApolloClient({
  link: ApolloLink.from([
    stateLink,
    httpLink
  ]),
  cache: cache
})

// const Client = new ApolloClient({
//   link: ApolloLink.from([
//     onError(({ graphQLErrors, networkError }) => {
//       if (graphQLErrors) {
//         graphQLErrors.map(
//           ({ message, locations, path}) =>
//             console.log(
//               `[GraphQL error]: Message: ${message}, Location: ${locations}, Path: ${path}`),
//         )
//       }
//       if (networkError) {
//         console.log(`[Network error]: ${ networkError }`)
//       }
//     }),
//     stateLink,
//     httpLink
//   ]),
//   cache
// })


export default Client
