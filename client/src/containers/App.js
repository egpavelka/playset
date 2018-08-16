import React from 'react'
import MainMenu from '../components/menus/MainMenu'
import { Switch, Route } from 'react-router-dom'
import { Container } from 'reactstrap'

// Routes
import Login from './users/Login'
import CreateTrack from './tracks/CreateTrack'
import TrackList from '../containers/tracks/TrackList'

// FontAwesome base
import { library } from '@fortawesome/fontawesome-svg-core'
import { faEnvelope, faKey } from '@fortawesome/free-solid-svg-icons'
library.add(faEnvelope, faKey)

const App = () => (
  <div className="App">
    <header className="App-header">
      <MainMenu />
    </header>
    <Container>
      <Switch>
        <Route exact path="/login" component={ Login } />
        <Route exact path="/submit" component={ CreateTrack } />
        <Route exact path="/" component={ TrackList } />
      </Switch>
    </Container>
  </div>
)

export default App
