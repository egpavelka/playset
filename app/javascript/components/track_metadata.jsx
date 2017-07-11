import React from 'react'
import ReactDOM from 'react-dom'

class TrackMetadata extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className="col-xs-7 col-xs-offset-1 text-right track-info">
        <div className="track-title">{ this.props.track.title }</div>
        <div className="track-artist">{ this.props.track.artist }</div>
        <div><span className="track-album">{ this.props.track.album }</span> --- <span className="track-year">{ this.props.track.year }</span></div>
      </div>
    )
  }
}

export default TrackMetadata
