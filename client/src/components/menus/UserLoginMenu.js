import React from 'react'
import {
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem } from 'reactstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faUserCircle } from '@fortawesome/free-solid-svg-icons'
import MainDropdownLink from './MainDropdownLink'
import { AUTH_TOKEN } from '../../constants'


class UserMenu extends React.Component {
  render () {
    const authToken = localStorage.getItem(AUTH_TOKEN)

    return (
      <UncontrolledDropdown nav inNavbar>
        <DropdownToggle nav caret>
          <FontAwesomeIcon icon={ faUserCircle } />
        </DropdownToggle>
        <DropdownMenu right>
          
          {authToken ? (
             <section>
               <MainDropdownLink endpoint="/profile" title="profile" />
               <DropdownItem divider />
               <DropdownItem onClick={() => {
                   localStorage.removeItem(AUTH_TOKEN)
                   this.props.history.push('/')
               }}>
                 logout
               </DropdownItem>
             </section>
          ) : (
             <MainDropdownLink endpoint="/login" title="login" />
          )}
        </DropdownMenu>
      </UncontrolledDropdown>
    )
  }
}

export default UserMenu
