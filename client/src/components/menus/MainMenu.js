import React from 'react'
import { withRouter } from 'react-router'
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav } from 'reactstrap'
import UserLoginMenu from './UserLoginMenu'
import MainNavLink from './MainNavLink'
import MainDropdownLink from './MainDropdownLink'

class MainMenu extends React.Component {
  constructor(props) {
    super(props)

    this.toggle = this.toggle.bind(this)
    this.state = {
      isOpen: false
    }
  }

  toggle() {
    this.setState({
      isOpen: !this.state.isOpen
    })
  }

  toggle() {
    this.setState({
      isOpen: !this.state.isOpen
    })
  }

  render() {
    return (
      <Navbar color="light" light expand="md">
        <NavbarBrand href="/">playsette</NavbarBrand>
        <NavbarToggler onClick={this.toggle} />
        <Collapse isOpen={this.state.isOpen} navbar>
          <Nav className="ml-auto" navbar>
            <MainNavLink endpoint="/login" title="login"/>
            <UserLoginMenu />
          </Nav>
        </Collapse>
      </Navbar>
    )
  }
}

export default withRouter(MainMenu)