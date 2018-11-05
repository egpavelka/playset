// onClick: Set state for track in playbar and card
// Display: show nextAction
import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'

const CurrentPlayButton = ({}) => (
    <Query query={ GET_CURRENT_TRACK_STATE }>
    <FontAwesomeIcon
     className='play-button'
  icon={ faPlayCircle }
  onClick ={() => client.writeData({ data: {}}) }/>
    </Query>
)
