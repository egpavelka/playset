import React from 'react'
import { Query } from 'react-apollo'
import { CardDeck } from 'reactstrap'
import Track from './components/Track'
import { GET_TRACKS } from '../../apollo'

export const TrackList = () => (
  <CardDeck>
    <Query query={ GET_TRACKS } className='card-deckx'>
      {({ loading, error, data })  => {
         if (loading) return "Loading..."
         if (error) return `Error! ${ error.message }`
         return data.tracks.map( (track, i) => (
           <Track
             key={ i }
             id={ track.id }
             service={ track.service }
             media_url={ track.media_url }
             media_query_url={ track.media_query_url }
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

