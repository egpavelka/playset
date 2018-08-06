import React from 'react'
import TestComponent from '../testComponent'
import MainMenu from '../components/menus/MainMenu'
import { Switch, Route } from 'react-router-dom'
// Routes
import Login from './users/Login'
import CreateTrack from './tracks/CreateTrack'
const App = () => (
  <div className="App">
    <header className="App-header">
      <MainMenu />
      <Switch>
        <Route exact path="/login" component={ Login } />
        <Route exact path="/submit" component={ CreateTrack } />
      </Switch>
    </header>
    <TestComponent />
  </div>
)

export default App
