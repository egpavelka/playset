import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, HttpLink, InMemoryCache }  from 'apollo-boost'
import { ApolloProvider } from 'react-apollo'
import './index.css'
import App from './App'
import registerServiceWorker from './registerServiceWorker'

const link = new HttpLink({
  uri: 'http://localhost:5100/graphql'
})

const client = new ApolloClient({
  link: link,
  cache: new InMemoryCache()
})

const AppWithProvider = () => (
  <ApolloProvider client={ client }>
    <App />
  </ApolloProvider>
)

ReactDOM.render(<AppWithProvider />, document.getElementById('root'))

registerServiceWorker()

