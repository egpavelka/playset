import { ApolloClient } from 'apollo-client'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { HttpLink } from 'apollo-link-http'
import { onError } from 'apollo-link-error'
import { withClientState } from 'apollo-link-state'
import { ApolloLink } from 'apollo-link'

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
  resolvers: {}
})

const Client = new ApolloClient({
  link: ApolloLink.from([
    onError(({ graphQLErrors, networkError }) => {
      if (graphQLErrors) {
        graphQLErrors.map(
          ({ message, locations, path}) =>
            console.log(
              `[GraphQL error]: Message: ${message}, Location: ${locations}, Path: ${path}`),
        )
      }
      if (networkError) {
        console.log(`[Network error]: ${ networkError }`)
      }
    }),
    stateLink,
    httpLink
  ]),
  cache
})


export default Client
