import React from 'react'
import { connect } from 'react-redux'

const mapStateToProps = state => {
  return { tracks: state.tracks }
}

const ConnectedTrackList = ({ tracks }) => (
  <div className="row row-eq-height tracks-container">
    { tracks.map(el => (
      <div class="track-container col-xs-12 col-lg-6 col-xl-4">
        <Track />
      </div>
    ))}
  </div>
)
const TrackList = connect(mapStateToProps)(ConnectedTrackList)

export default TrackList
