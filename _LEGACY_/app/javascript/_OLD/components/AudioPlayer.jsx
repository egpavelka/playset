import React from 'react'
import ReactDOM from 'react-dom'
import PlayButton from './track/play_button'
import { soundcloudPublicClientId } from '../constants/secrets'

class AudioPlayer extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      audioLoaded: false,
      timePlayed: 0,
      isPlaying: false,
      nextAction: 'play'
    }
    this._setAudio = this.setAudio.bind(this)
    this._setSoundcloudUrl = this.setSoundcloudUrl.bind(this)
    this._setListenersOnAudioLoad = this.setListenersOnAudioLoad.bind(this)
    this._setStatesOnPlay = this.setStatesOnPlay.bind(this)
    this._setStatesOnPause = this.setStatesOnPause.bind(this)
    this.togglePlayState = this.togglePlayState.bind(this)

  }

// LOADING

setSoundcloudUrl() {
  var callUrl = this.props.track.media_path + '?client_id=' +  soundcloudPublicClientId
  fetch(callUrl)
  .then((response) => {
    this.setState({ trackAudio: new Audio(response.url),  audioLoaded: true },
    () => { this._setListenersOnAudioLoad() })
  })
  .catch((error) => { console.log(error) })
}

  setAudio() {
    if (this.props.embeddedService == 'Soundcloud') {
      this._setSoundcloudUrl()
    } else {
      this.setState({ trackAudio: new Audio(this.props.track.media_path), audioLoaded: true }, () => { this._setListenersOnAudioLoad() })
    }
  }

  setListenersOnAudioLoad() {
    this.state.trackAudio.addEventListener('pause', this._setStatesOnPause)
    this.state.trackAudio.addEventListener('play', this._setStatesOnPlay)
    this.state.trackAudio.addEventListener('timeupdate',
    (t) => { this.setState({ timePlayed: t }) }
    )
  }

  componentWillMount() {
    this._setAudio()
  }

  // PLAYING

  setStatesOnPlay() {
    this.setState({ isPlaying: true, nextAction: 'pause' })
  }

  setStatesOnPause() {
    // next_icon_by_type = this.props.
    this.setState({ isPlaying: false, nextAction: 'play' })
  }

  togglePlayState() {
    var audio = this.state.trackAudio
    this.state.isPlaying ? audio.pause() : audio.play()
  }

  render() {

    return (
      <div className="col-3" onClick={ this.togglePlayState }>
        <PlayButton id={ this.props.track.id } nextAction={ this.state.nextAction } isPlaying={ this.state.isPlaying ? 'active-button' : '' } />
      </div>
    )
  }
}

export default AudioPlayer
