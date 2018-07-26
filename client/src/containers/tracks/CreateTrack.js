import React from 'react'
import { Button, Form } from 'reactstrap'
import FormInput from '../application/Forms/FormInput'

class CreateTrack extends React.Component {
  state = {
    submittedUrl: '',
    mediaUrl: '',
    title: '',
    artist: '',
    album: '',
    year: '',
    sourceService: '',
    sourceServiceId: '',
    mediaType: '',
    userId: ''
  }

  render () {
    const { submittedUrl, mediaUrl, title, artist, album, year, sourceService, sourceServiceId, mediaType, userId } = this.state
    return (
        <Form>
        <FormInput fieldName='submittedUrl'
      label='url'
      value={ this.state.submittedUrl }
      update={ e => this.setState(
        { submittedUrl: e.target.value })}/>
        <FormInput fieldName='title'
      value={ this.state.title }
      update={ e => this.setState(
        { title: e.target.value })}/>
        <FormInput fieldName='artist'
      value={ this.state.artist }
      update={ e => this.setState(
        { artist: e.target.value })}/>
        <FormInput fieldName='album'
      value={ this.state.album }
      update={ e => this.setState(
        { album: e.target.value })}/>
        <FormInput fieldName='year'
      value={ this.state.year }
      update={ e => this.setState(
        { year: e.target.value })}/>
        </Form>
    )
  }
}
