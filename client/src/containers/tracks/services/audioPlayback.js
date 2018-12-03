import React, { Component } from 'react'

class Audio extends Component {

  handlePlay() {
    this.audio.play()
  }

  handleStop() {
    this.audio.currentTime = 0
    this.slider.value = 0
    this.audio.pause()
  }

  componentDidMount() {
    this.slider.value = 0
    this.currentTimeInterval = null
  }

  render() {
    return (
        <audio>
        <source src="" />
        </audio>
    )
  }
}