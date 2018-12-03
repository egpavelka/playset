import React from 'react'
import ReactDOM from 'react-dom'
import registerServiceWorker from './registerServiceWorker'
import { BrowserRouter } from 'react-router-dom'
import { ApolloProvider } from 'react-apollo'
import 'bootstrap/dist/css/bootstrap.css'
import './assets/stylesheets/application.scss'

import Client from './apollo/Client'
import App from './App'

const AppWithProvider = () => (
  <BrowserRouter>
    <ApolloProvider client={ Client }>
      <App />
    </ApolloProvider>
  </BrowserRouter>
)

ReactDOM.render(<AppWithProvider />, document.getElementById('root'))

registerServiceWorker()
