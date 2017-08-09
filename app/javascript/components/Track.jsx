import React from 'react'
import ReactDOM from 'react-dom'
import AudioPlayer from './AudioPlayer'
import Likes from './Likes'
import Metadata from './track/metadata'
import SubmissionData from './track/submission_data'
import EmbeddingData from './track/embedding_data'

class Track extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      isLiked: false,
      colorScheme: 1
    }
    this._setColorScheme = this.setColorScheme.bind(this)
  }

  setColorScheme() {
    const min = 1
    const max = 28 // must be changed manually!
    const random = Math.floor(min + Math.random() * (max - min + 1))
    this.setState({ colorScheme: random })
  }

  componentWillMount() {
    this._setColorScheme()
  }

  render() {

    var backgroundArtStyle = {
      backgroundImage: 'url(' + this.props.albumArtPath + ')',
      backgroundPosition: 'center'
    }

    return (
      <div id={ 'track-' + this.props.track.id } className={`row track color-scheme-` + this.state.colorScheme }>

      <div className="col-12 track-background" style={ backgroundArtStyle }>
        <div className="row track-overlay">
          <AudioPlayer track={ this.props.track } embeddedService={ this.props.media.source_service } />
          <Metadata track={ this.props.track } />
          <SubmissionData userId={ this.props.track.user_id } user={ this.props.user } formattedTime={ this.props.formattedTime } />
        </div>
      </div>

        <div className="row track-base">
          <EmbeddingData sourceService={ this.props.media.source_service } sourcePath={ this.props.media.source_path } />
          <Likes likedState={ this.state.isLiked ? 'active-button' : '' } />
        </div>

      </div>
    )
  }
}

export default Track
