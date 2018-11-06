import React, { Component } from 'react'
// import AudioPlayer from './AudioPlayer'
import { Card, CardFooter, CardImg, CardImgOverlay, CardSubtitle, CardText, CardTitle } from 'reactstrap'
import { soundcloudPublicClientId } from '../../secrets'

class Track extends Component {
  state = {
    media_url: this.props.media_url,
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

  componentWillMount() {
    if (this.props.service === 'Soundcloud') {
      this.setSoundcloudUrl()
    }
    this.setState({ audio: new Audio(this.state.media_url)})
  }

  componentDidMount() {
    this.state.audio.addEventListener('onpause',
      this.setState({ playing: false }))
    this.state.audio.addEventListener('onplaying',
      this.setState({ playing: true }))
    this.state.audio.addEventListener('ontimeupdate',
      (t) => { this.setState({ timePlayed: t }) }
    )
  }

  // PLAYING


  togglePlayState() {
    var audio = this.state.audio
    console.log(this.state.playing)
    this.state.playing ? audio.pause() : audio.play()
  }

  render() {
    return (
      <Card inverse>
        <CardImg width="100%" src={ this.props.album_art_url } />
        <CardImgOverlay>
          <CardTitle>{ this.props.title }</CardTitle>
          <CardSubtitle>{ this.props.artist }</CardSubtitle>
          <CardText>{ this.props.album }</CardText>
        </CardImgOverlay>
        <CardFooter className="text-muted">
          { this.props.service }
        </CardFooter>
      </Card>
    )
  }
}

export default Track
