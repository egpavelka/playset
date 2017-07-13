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
    } else if (this.state.trackAudio == undefined) {
      this.setState({ trackAudio: new Audio(this.props.track.media_path) })
    }
  }

  setSoundcloudUrl() {
    var callUrl = this.props.track.media_path + '?client_id=' +  soundcloudPublicClientId
    fetch(callUrl)
    .then((response) => { this.setState({ trackAudio: new Audio(response.url) }) })
    .catch((error) => { console.log(error) })
  }

  componentWillMount() {

  }
  componentDidMount() {
    this.setAudio()
    console.log(this.state.trackAudio)
    // this.state.trackAudio.addEventListener('ended', function(e){ console.log(e) })
    // this.state.trackAudio.addEventListener('timeupdate', function(e){ console.log(e) })
  }

  togglePlayState() {
    console.log(this.state.isPlaying)
    if (this.state.isPlaying) {
      this.state.trackAudio.pause()
      this.setState({ isPlaying: false, nextAction: 'play' })
    } else {
      this.setAudio()
      this.state.trackAudio.play()
      this.setState({ isPlaying: true, nextAction: 'pause' })
    }
  }

  render() {
    return (
<div className="col-xs-4" onClick={ this.togglePlayState }>
  <audio preload='none'><source src={ this.state.trackAudio } /></audio>
  <PlayButton id={ this.props.track.id } nextAction={ this.state.nextAction } />
</div>
    )
  }
}

// AudioPlayer.propTypes = {
//
// }

export default AudioPlayer
