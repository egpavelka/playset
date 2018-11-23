// onClick: Set state for track in playbar and card
// Display: show nextAction
import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'
import { GET_CURRENT_TRACK_STATE } from '../graphql/trackClientState'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'


const PlayButton = ({ track }) => (
    <Query query={ GET_CURRENT_TRACK_STATE }>
    <FontAwesomeIcon className='play-button' icon={ faPlayCircle } onClick ={() => Client.writeData({ data: { currentTrack: track }}) }/>
    </Query>
)
