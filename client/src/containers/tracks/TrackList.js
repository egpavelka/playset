import React from 'react'
import * as trackListActions from '../actions/trackListActions'

const mapStateToProps = state => {
  return { tracks: state.tracks }
}

const ConnectedTracks = ({ tracks }) => (
  <div className="row row-eq-height tracks-container">
    { tracks.map(tr => (
      <div class="track-container col-xs-12 col-lg-6 col-xl-4">
        <Track />
      </div>
    ))}
  </div>
)
const TrackList = connect(mapStateToProps)(ConnectedTracks)

export default TrackList
