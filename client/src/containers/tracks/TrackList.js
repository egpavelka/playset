import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'
import { CardColumns, CardDeck } from 'reactstrap'
import Track from './Track'

const GET_TRACKS = gql`
  {
    tracks {
      id
      media_url
      service
      title
      artist
      album
      album_art
      year
    }
  }
`
const TrackList = () => (
  <CardDeck>
    <Query query={ GET_TRACKS } className='card-deckx'>
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
           album_art={ track.album_art }
           />
         ))
         
      }}
    </Query>
  </CardDeck>
)

export default TrackList
