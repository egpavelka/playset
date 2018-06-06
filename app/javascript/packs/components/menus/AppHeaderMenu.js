import React from 'react'
import { Link } from 'react-router-dom'

class AppHeaderMenu extends React.Component {
  render () {
    return (
        <section>
        <li className="CURRENT-CLASS nav-item">
        <a className="nav-link" data-toggle="collapse" href="#collapseCharts" aria-expanded="false" aria-controls="collapseCharts">
        CHARTS
        <i className="fa fa-caret-down" aria-hidden="true"></i>
        </a>
        <section className="collapse" id="collapseCharts">
        <div><Link to="/">All</Link></div>
        <div className="dropdown-divider"></div>
        <div><Link to="/audio">Audio</Link></div>
        <div><Link to="/video">Video</Link></div>
        </section>
        </li>
        <li className="CURRENT-PATH nav-item">
        <Link to="/submit" className="nav-link">SUBMIT</Link>
        </li>
        </section>
    )
  }
}

export default AppHeaderMenu
