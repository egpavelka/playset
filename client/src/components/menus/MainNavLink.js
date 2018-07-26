import React from 'react'
import { Link } from 'react-router-dom'
import { NavItem, NavLink } from 'reactstrap'

const MainNavLink = props => (
    <NavItem>
      <Link to={ props.endpoint }>
        <NavLink>{ props.title }</NavLink>
      </Link>
    </NavItem>
)

export default MainNavLink
