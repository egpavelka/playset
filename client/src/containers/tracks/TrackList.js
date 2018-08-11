import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'
import Track from './Track'

const GET_TRACKS = gql`
  {
    tracks {
      id
      media_url
      service
      title
      artist
    }
  }
`
const TrackList = () => (

    <Query query={ GET_TRACKS }>
      {({ loading, error, data })  => {
         if (loading) return "Loading..."
        if (error) return `Error! ${ error.message }`
        return data.tracks.map( track => (
            <Track
          id={ track.id }
          service={ track.service }
          media_url={ track.media_url }
          title= { track.title }
          artist={ track.artist }
            />
         ))
      }}
    </Query>
)

export default TrackList
