// don't include unless entire site is converted to React

import React from 'react'
import { Route, IndexRoute } from 'react-router'
import App from '../components/App'

export default (
  <Route path="/" component={ App }>
    <IndexRoute component={ Home } />
    <Route path="/tracks" component={ TrackList } />
  </Route>
)
