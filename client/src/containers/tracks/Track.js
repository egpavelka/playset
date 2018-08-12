import React, { Component } from 'react'
// import AudioPlayer from './AudioPlayer'
import { Card, CardFooter, CardImg, CardImgOverlay, CardText, CardTitle } from 'reactstrap'

class Track extends Component {
  state = {
    playing: false
  }

  render() {
    return (
      <Card inverse>
        <CardImg width="100%" src={ this.props.album_art } />
        <CardImgOverlay>
          <CardTitle className='track-title'>{ this.props.title }</CardTitle>
          <CardTitle className='track-artist'>{ this.props.artist }</CardTitle>
          <CardText className='track-album'>{ this.props.album }</CardText>
        </CardImgOverlay>
        <CardFooter className="text-muted track-info">
          { this.props.service }
        </CardFooter>
      </Card>
      
    )
  }
}

export default Track
