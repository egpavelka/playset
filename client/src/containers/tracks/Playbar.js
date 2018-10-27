import React, { Component } from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'
import Track from './Track'

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
 
      
    )
  }
}

export default Playbar
