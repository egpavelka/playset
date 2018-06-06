import React from 'react'
import { Link } from 'react-router-dom'

class UserHeaderMenu extends React.Component {
  render () {
    return (

        <li className="nav-item">
        <a className="nav-link session-nav" data-toggle="collapse" href="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
        <i className="fa fa-user"></i>
        USERNAME
        <i className="fa fa-caret-down" aria-hidden="true"></i>
        </a>
        <section className="collapse" id="collapseUser">
        <div><Link to="/profile">Profile</Link></div>
        <div><Link to="/settings">Settings</Link></div>
        <div className="dropdown-divider"></div>
        <div><Link to="/logout"></Link></div>
        <div><Link to="/login">Login</Link></div>
        <div><Link to="/signup">Sign up</Link></div>
        </section>
        </li>

    )
  }
}

export default UserHeaderMenu
