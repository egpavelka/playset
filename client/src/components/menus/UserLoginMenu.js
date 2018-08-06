import React from 'react'
import {
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem } from 'reactstrap'
import MainDropdownLink from './MainDropdownLink'
import { AUTH_TOKEN } from '../../constants'

class UserMenu extends React.Component {
  render () {
    const authToken = localStorage.getItem(AUTH_TOKEN)

    return (
       <UncontrolledDropdown nav inNavbar>
        <DropdownToggle nav caret>
          Account
        </DropdownToggle>
        <DropdownMenu right>
        {authToken && (
            <MainDropdownLink endpoint="/profile" text="profile" />
        )}
        <DropdownItem divider />
        {authToken ? (
            <DropdownItem onClick={() => {
              localStorage.removeItem(AUTH_TOKEN)
              this.props.history.push('/')
            }}>
            logout
          </DropdownItem>
        ) : (
            <MainDropdownLink endpoint="/login" title="login" />
        )}
        </DropdownMenu>
        </UncontrolledDropdown>
    )
  }
}

export default UserMenu
