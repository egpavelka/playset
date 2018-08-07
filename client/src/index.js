import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'
import { ApolloClient, HttpLink, InMemoryCache }  from 'apollo-boost'
import { ApolloProvider } from 'react-apollo'
import { setContext } from 'apollo-link-context'
import { AUTH_TOKEN } from './constants'
import 'bootstrap/dist/css/bootstrap.css'
import 'assets/stylesheets/application.css'
import App from './containers/App'
import registerServiceWorker from './registerServiceWorker'

const link = new HttpLink({
  uri: 'http://localhost:5100/graphql'
})

const authLink = setContext((_, { headers }) => {
  const token = localStorage.getItem(AUTH_TOKEN)
  return {
    headers: {
      ...headers,
      authorization: token ? `Bearer ${token}` : ''
    }
  }
})

const client = new ApolloClient({
  link: authLink.concat(link),
  cache: new InMemoryCache(),
  /* clientState: {
   *   defaults,
   *   resolvers,
   *   typeDefs
   * }*/
})

const AppWithProvider = () => (
  <BrowserRouter>
    <ApolloProvider client={ client }>
      <App />
    </ApolloProvider>
  </BrowserRouter>
)

ReactDOM.render(<AppWithProvider />, document.getElementById('root'))

registerServiceWorker()

