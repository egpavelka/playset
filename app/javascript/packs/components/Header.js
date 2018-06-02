import React from 'react'
import { Link } from 'react-router-dom'

class Header extends React.Component {
  render () {
    return (
        <header>
        <nav className="navbar navbar-expand-md">
        <div className="navbar-brand ps-app-title">
        link_to "playsette", root_path, id: 'logo'
      </div>
        <button className="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <i className="fa fa-bars"></i>
    </button>
    <div className="collapse navbar-collapse app-menu" id="navbarNavDropdown">
      <ul className="navbar-nav">
         render 'layouts/menus/main_app_menu' 
        render 'layouts/menus/main_user_menu'
      </ul>
    </div>
  </nav>
</header>
    )
  }
}

export default Header
