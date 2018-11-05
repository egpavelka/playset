import React, { Component } from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'
import Track from './Track'
import gql from 'graphql-tag'
import { Mutation, Query } from 'react-apollo'

const SHOW_PLAYBAR_TRACK = gql`
  {
    tracks @client {
      id
      service
      media_url
      title
      artist
      album
      year
    }
    currentTrack @client
  }
`
class Playbar extends Component {


  render() {
    return (
      <Query query={ SHOW_PLAYBAR_TRACK }>
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
