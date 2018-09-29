import React, { Component } from 'react'
// import AudioPlayer from './AudioPlayer'
import { Card, CardFooter, CardImg, CardImgOverlay, CardSubtitle, CardText, CardTitle } from 'reactstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'
import { soundcloudPublicClientId } from '../../secrets'
class Track extends Component {
  state = {
    media_url: this.props.media_url,
    audio: null,
    loaded: false,
    playing: false,
    nextAction: 'play',
    timePlayed: 0
  }

  setSoundcloudUrl() {
    var callUrl = this.props.media_query_url + '?client_id=' +  soundcloudPublicClientId
    fetch(callUrl)
      .then((response) => {
        this.setState({ media_url: response.url })
      })
      .catch((error) => { console.log(error) })
  }

  setAudio() {
    if (this.props.service == 'Soundcloud') {
      this.setSoundcloudUrl()
    }
    this.state.audio = new Audio(this.state.media_url)
    this.state.loaded = true
    this.setListenersOnAudioLoad()
  }

  setListenersOnAudioLoad() {
    console.log(this.state.audio)
    this.state.audio.addEventListener('pause', this.setStatesOnPause)
    this.state.audio.addEventListener('play', this.setStatesOnPlay)
    this.state.audio.addEventListener('timeupdate',
      (t) => { this.setState({ timePlayed: t }) }
    )
  }

  componentWillMount() {
    this.setAudio()
    console.log(this.state)
  }

  // PLAYING

  setStatesOnPlay() {
    this.state.playing = true
    this.statea.nextAction= 'pause'
  }

  setStatesOnPause() {
    this.state.playing = false
    this.state.nextAction = 'play'
  }

  togglePlayState() {
    this.state.playing ? this.state.audio.pause() : this.state.audio.play()
  }

  render() {
    return (
      <Card inverse>
        <CardImg width="100%" src={ this.props.album_art_url } />
        <CardImgOverlay>
          <FontAwesomeIcon className='play-button' icon={ faPlayCircle } onClick ={ this.togglePlayState() }/>
          <CardTitle>
            { this.props.title }
          </CardTitle>
          <CardSubtitle>
            { this.props.artist }
          </CardSubtitle>
          <CardText>
            { this.props.album }
          </CardText>
        </CardImgOverlay>
        <CardFooter className="text-muted">
          { this.props.service }
        </CardFooter>
      </Card>
      
    )
  }
}

export default Track
