import React, { Component } from 'react'
// import AudioPlayer from './AudioPlayer'
import { Card, CardFooter, CardImg, CardImgOverlay, CardSubtitle, CardText, CardTitle } from 'reactstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlayCircle } from '@fortawesome/free-solid-svg-icons'

class Track extends Component {
  state = {
    playing: false
  }

  render() {
    return (
      <Card inverse>
        <CardImg width="100%" src={ this.props.album_art_url } />
        <CardImgOverlay>
          <FontAwesomeIcon className='play-button' icon={ faPlayCircle } />
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
