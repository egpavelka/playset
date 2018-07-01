import React from 'react'
import { Link } from 'react-router-dom'
import PropTypes from 'prop-types'

export default function NavItemLink(props) {
  return (
      <li className="nav-item">
      <Link to={ props.href }>{ props.label }</Link>
      </li>
  )
}

NavItemLink.propTypes = {
  href: PropTypes.string,
  label: PropTypes.string
}
