import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'
import 'bootstrap/dist/css/bootstrap.css'
import './assets/stylesheets/application.scss'

import Client from './Client'
import registerServiceWorker from './registerServiceWorker'
import { ApolloProvider } from 'react-apollo'
import App from './containers/App'


const AppWithProvider = () => (
  <BrowserRouter>
    <ApolloProvider client={ Client }>
      <App />
    </ApolloProvider>
  </BrowserRouter>
)

ReactDOM.render(<AppWithProvider />, document.getElementById('root'))

registerServiceWorker()

