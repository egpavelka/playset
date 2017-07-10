import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class Track extends React.Component {
  constructor(props) {
    super(props)
    console.log(props)
  }

  render() {

    var backgroundArtStyle = {
      backgroundImage: 'url(' + this.props.track.album_art+ ')',
      backgroundPosition: 'center'
    }

    return (
      <div id={`track-{ this.props.track.id }`} className="row track">

      <div className="track-background" >
        <div className="track-overlay">
          <div className="col-xs-4"><div className="track-play-button">
            <span className="glyphicon glyphicon-play" aria-hidden="true"></span>
          </div></div>
          <div className="col-xs-7 col-xs-offset-1 text-right track-info">
            <div className="track-title">{ this.props.track.title }</div>
            <div className="track-artist">{ this.props.track.artist }</div>
            <div><span className="track-album">{ this.props.track.album }</span>
              <span className="track-year">{ this.props.track.year }</span></div>
          </div>
          <div className="col-xs-7 track-details">posted by { this.props.user.username } || { this.props.track.updated_at }</div>
        </div>
      </div>

        <div className="track-base col-xs-12">
          <div className="embedded-service"><img src={'/assets/service_icons/' +  this.props.media.source_service + '.png'} />via { this.props.media.source_service }</div>
          <div className="track-likes"><span className="track-like-button"><span className="glyphicon glyphicon-heart" aria-hidden="true"></span></span>
          <span className="track-like-count">450</span></div>
        </div>

      </div>
    )
  }
}

export default Track
