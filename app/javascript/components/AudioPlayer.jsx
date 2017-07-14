import React from 'react'
import ReactDOM from 'react-dom'
import PlayButton from './track/play_button'
import { soundcloudPublicClientId } from '../assets/secrets'

class AudioPlayer extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isPlaying: false,
      nextAction: 'play'
    }
    this.setAudio = this.setAudio.bind(this);
    this.setSoundcloudUrl = this.setSoundcloudUrl.bind(this);
    this.togglePlayState = this.togglePlayState.bind(this);

  }
/* THINGS THAT CLEAR this.state.currentTrack
finished // track has played in full
play on different Track

recently listened: if track play time > 30sec

*/
  setAudio() {
    if (this.props.embeddedService == 'Soundcloud') {
      this.setSoundcloudUrl()
    } else {
      this.setState({ trackAudio: new Audio(this.props.track.media_path) })
    }
  }

  setSoundcloudUrl() {
    var callUrl = this.props.track.media_path + '?client_id=' +  soundcloudPublicClientId
    fetch(callUrl)
    .then((response) => {
      this.setState({ trackAudio: new Audio(response.url) }) })
    .catch((error) => { console.log(error) })
  }

  componentDidMount() {
    this.setAudio()
  }

  componentDidUpdate() {
    // this.state.trackAudio.addEventListener('pause', function(){ this.setState({ playState: 'pause', nextAction: 'play' }) })
    // this.state.trackAudio.addEventListener('play', function(){ this.setState({ playState: 'play', nextAction: 'pause' }) })
    // this.state.trackAudio.addEventListener('timeupdate', function(e){ console.log(e) })
  }

  togglePlayState() {
    var audio = this.state.trackAudio
    if (this.state.isPlaying) {
      audio.pause()
      this.setState({ isPlaying: false, nextAction: 'play' })
    } else {
      audio.play()
      this.setState({ isPlaying: true, nextAction: 'pause' })
    }
  }

  render() {
    return (
      <div className="col-xs-4" onClick={ this.togglePlayState }>
        <PlayButton id={ this.props.track.id } nextAction={ this.state.nextAction } />
      </div>
    )
  }
}

// AudioPlayer.propTypes = {
//
// }

export default AudioPlayer
