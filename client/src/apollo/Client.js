import { ApolloClient } from 'apollo-client'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { HttpLink } from 'apollo-link-http'
import { withClientState } from 'apollo-link-state'
import { ApolloLink } from 'apollo-link'

import { setCurrentTrack,
         clearCurrentTrack } from './mutations/trackCacheMutations'


/* INITIALIZE CACHE AND LINK TO SERVER */
const cache = new InMemoryCache()

const httpLink = new HttpLink({
  uri: 'http://localhost:8000/graphql',
  fetchOptions: {
    mode: 'no-cors'
  }
})

/* SET UP CLIENT WITH CACHE */
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

export default new ApolloClient({
  link: ApolloLink.from([
    stateLink,
    httpLink
  ]),
  cache: cache
})
