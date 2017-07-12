import React from 'react'
import ReactDOM from 'react-dom'

const Metadata = props => (
  <div className="col-xs-7 col-xs-offset-1 text-right track-info">
    <div className="track-title">{ props.track.title }</div>
    <div className="track-artist">{ props.track.artist }</div>
    <div><span className="track-album">{ props.track.album }</span> --- <span className="track-year">{ props.track.year }</span></div>
  </div>
)

export default Metadata
