import React from 'react'
import NavItemLink from './shared/NavItemLink'

class Footer extends React.Component {
  render () {
    return (
        <footer className="app-menu">
        <ul className="nav nav-pills">
        <NavItemLink href="/about" label="About" />
        <NavItemLink href="/contact" label="Contact" />
        <NavItemLink href="/help" label="Help" />
        </ul>
        </footer>

    )
  }
}

export default Footer
