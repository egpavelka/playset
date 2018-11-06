import React, { Component } from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'
import Track from './Track'

import { Mutation, Query } from 'react-apollo'
import { GET_CURRENT_TRACK } from './graphql/trackClientState'

class Playbar extends Component {


  render() {
    return (
      <Query query={ GET_CURRENT_TRACK }>
        {( loading, error, data ) => {
           if (loading) return "Loading..."
           if (error) return `Error! ${ error.message }`
           console.log(data)
          }}
        </Query>
    )
  }
}

export default Playbar
