import React from 'react'
import ReactDOM from 'react-dom'
import Track from './Track'

export default class Playbar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      playing: false,
      currentTrack: nil,
      trackList: nil
    }
  }

  componentDidMount() {
    window.addEventListener('play', (e) => {
      if (window.currentlyPlaying && window.currentlyPlaying != e.target) {
        window.currentlyPlaying.pause()
      }
      window.currentlyPlaying = e.target
      console.log(window.currentlyPlaying)
    })
  }

  render() {

    return (
      <div class="playbar"></div>
    )
  }
}
