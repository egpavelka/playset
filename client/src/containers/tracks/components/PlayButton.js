// onClick: Set state for track in playbar and card
// Display: show nextAction
import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'

() => {
  if data.currentTrack 
}

const PlayButton = ({ track, next_action }) => (
    <Query query={ GET_CURRENT_TRACK_STATE }>
    <FontAwesomeIcon className='play-button' icon={ faPlayCircle } onClick ={() => client.writeData({ data: { currentTrack: track }}) }/>
    </Query>
)
