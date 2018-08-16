import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'
import { CardDeck } from 'reactstrap'
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
      year
      album_art_url
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
             album={ track.album }
             year={ track.year }
             album_art_url={ track.album_art_url }
           />
         ))
         
      }}
    </Query>
  </CardDeck>
)

export default TrackList
