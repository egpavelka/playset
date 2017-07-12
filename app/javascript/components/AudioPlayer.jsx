import React from 'react'
import ReactDOM from 'react-dom'
import PlayButton from './track/play_button'

class AudioPlayer extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      trackAudio: new Audio(this.props.track.mediaPath),
      isPlaying: false,
      nextAction: 'play'
    }
    this.togglePlayState = this.togglePlayState.bind(this);
  }
/* THINGS THAT CLEAR this.state.currentTrack
finished // track has played in full
play on different Track

recently listened: if track play time > 30sec

*/

  componentDidMount() {
    this.state.trackAudio.addEventListener('ended', function(e){ console.log(e) })
    this.state.trackAudio.addEventListener('timeupdate', function(e){ console.log(e) })
  }

  togglePlayState() {
    var trackAudio = this.state.trackAudio
    console.log(this.state.isPlaying)
    if (this.state.isPlaying) {
      trackAudio.pause()
      this.setState({ isPlaying: false })
    } else {
      console.log("i know")
      trackAudio.play()
      this.setState({ isPlaying: true })
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

export default AudioPlayer
