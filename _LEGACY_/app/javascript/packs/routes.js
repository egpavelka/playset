import React from 'react'
import { Route } from 'react-router-dom'
import { ConnectedRouter } from 'react-router-redux'
import { history } from './store'
import App from './containers/App'
import About from './containers/about'

export default () => {
  return (
    <ConnectedRouter history={ history }>
      <div>
        <Route exact path='/' component={ App } />
        <Route path ='/about' component={ About } />
      </div>
    </ConnectedRouter>
  )
}