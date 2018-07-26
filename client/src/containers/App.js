import React from 'react'
import TestComponent from '../testComponent'
import Login from './users/Login'
import MainMenu from '../components/menus/MainMenu'
import { Switch, Route } from 'react-router-dom'

const App = () => (
  <div className="App">
    <header className="App-header">
      <MainMenu />
      <Switch>
        <Route exact path="/login" component={ Login } />
      </Switch>
    </header>
    <TestComponent />
  </div>
)

export default App
