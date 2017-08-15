import React from 'react'
import ReactDOM from 'react-dom'

class Metadata extends React.Component {
  constructor(props) {
    super(props)

    this.renderAlbumInfo = this.renderAlbumInfo.bind(this)
  }

  renderAlbumInfo() {
    return (
      <span className="track-album-info">
        <span className="track-album">{this.props.track.album}</span>
        { this.props.track.year !== '' ?
          <span className="track-year">{ this.props.track.year }</span>
          : null
        }
      </span>
    )
  }

  render() {

    return (
      <div className="col-8 offset-1 text-right track-info">
        <span className="track-title">{this.props.track.title}</span>
        <span className="track-artist">{this.props.track.artist}</span>
        { this.props.track.album !== '' || this.props.track.year !== ''
          ? this.renderAlbumInfo()
          : null
        }
      </div>
    )
  }
}

export default Metadata
