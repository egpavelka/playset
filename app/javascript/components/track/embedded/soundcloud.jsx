import React from 'react'
import ReactDOM from 'react-dom'

class Soundcloud extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      streamUrl: nil,
      streamUrlFetchedAt: nil
    }
  }

  play() {
    
  }

  pause() {
    this.setState({ timePausedAt: this.props.timePausedAt, isPlaying: false, isPaused: true })
  }

  stop() {
    this.setState({ timePausedAt: nil, streamUrl: nil, streamUrlFetchedAt: nil, })
  }

  render() {

    return (
<div></div>
    )
  }
}

export default Soundcloud
