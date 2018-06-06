import React from 'react'
import { Link } from 'react-router-dom'
import AppHeaderMenu from './menus/AppHeaderMenu'
import UserHeaderMenu from './menus/UserHeaderMenu'

class Header extends React.Component {
  render () {
    return (
      <header>
        <nav className="navbar navbar-expand-md">
          <div className="navbar-brand ps-app-title">
            playsette
          </div>
          <button className="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <i className="fa fa-bars"></i>
          </button>
          <div className="collapse navbar-collapse app-menu" id="navbarNavDropdown">
            <ul className="navbar-nav">
              <AppHeaderMenu />
              <UserHeaderMenu />
            </ul>
          </div>
        </nav>
      </header>
    )
  }
}

export default Header
