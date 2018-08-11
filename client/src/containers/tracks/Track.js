import React, { Component } from 'react'
// import AudioPlayer from './AudioPlayer'
import { Card, CardTitle, CardText, CardImg, CardImgOverlay, CardFooter } from 'reactstrap'

class Track extends Component {
  state = {
    playing: false,
    album_art: 'https://i.ytimg.com/vi/7PmUtmfTmbg/maxresdefault.jpg'
  }

  render() {
    return (
        <div>
        <Card inverse>
        <CardImg width="100%" src={ this.state.album_art } />
        <CardImgOverlay>
          <CardTitle className='track-title'>{ this.props.title }</CardTitle>
          <CardTitle className='track-artist'>{ this.props.artist }</CardTitle>
          <CardText className='track-album'>{ this.props.album }</CardText>
        </CardImgOverlay>
        <CardFooter className="text-muted track-info">
          { this.props.service }
        </CardFooter>
        </Card>
        </div>
    )
  }
}

export default Track
