import React from 'react'
import ReactDOM from 'react-dom'

class Metadata extends React.Component {
  constructor(props) {
    super(props)

    this.renderAlbumInfo = this.renderAlbumInfo.bind(this)
  }

  renderAlbumInfo() {
    const hasAlbumInfo = this.props.track.album || this.props.track.year
    if (hasAlbumInfo) {
      return (
        <div className="track-album-info">
          <span className="track-album">{this.props.track.album}</span>
          <span className="track-year">{ this.props.track.year }</span>
        </div>
      )
    }
  }

  render() {

    return (
      <div className="col-8 offset-1 text-right track-info">
        <div className="track-title">{this.props.track.title}</div>
        <div className="track-artist">{this.props.track.artist}</div>
        { this.renderAlbumInfo() }
      </div>
    )
  }
}

export default Metadata
