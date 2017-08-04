import React from 'react'
import ReactDOM from 'react-dom'
import Track from './Track'

class Tracks extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      page: 1,
      tracksPerPage: 50,
      hasTrackPlaying: false,
      currentTrack: nil // id of track playing
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
<div></div>
    )
  }
}

export default Tracks
