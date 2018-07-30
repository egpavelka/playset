import React from 'react'
import { Button, Form } from 'reactstrap'
import FormInput from '../application/Forms/FormInput'
import gql from 'graphql-tag'
import { Mutation } from 'react-apollo'

const CHECK_TRACK_MUTATION = gql`
  mutation CheckTrackMutation($submittedUrl: String!) {
    check_track(submittedUrl: $submittedUrl) {
      // ...
    }
  }
`
const CREATE_TRACK_MUTATION = gql`
mutation CreateTrackMutation($submittedUrl: String!, $mediaUrl: !String, $title: String! $artist: String!, $album: String!, $year: String!, $sourceService: String!, $sourceServiceId: String!, $mediaType: String!, userId: String!) {
  create_track(submitted_url: $submittedUrl, media_url: $mediaUrl, title: $title, artist: $artist, album: $album, year: $year, source_service: $sourceService, source_service_id: $sourceServiceId, media_type: $mediaType, user_id: $userId) {
    // ...
  }
}
`
class CreateTrack extends React.Component {
  state = {
    valid: '',
    submittedUrl: '',
    mediaUrl: '',
    sourceService: '',
    sourceServiceId: '',
    mediaType: '',
    userId: '',
    title: '',
    artist: '',
    album: '',
    year: ''
  }

  render () {
    const { submittedUrl, title, artist, album, year } = this.state
    return (
      <Form>
        {!valid && (
           <FormInput fieldName='submittedUrl'
                      label='url'
                      value={ submittedUrl }
                      update={ e => this.setState(
                          { submittedUrl: e.target.value })}/>
        )}
        {valid && (
           <FormInput fieldName='title'
                      value={ title }
                      update={ e => this.setState(
                          { title: e.target.value })}/>
           <FormInput fieldName='artist'
                      value={ artist }
                      update={ e => this.setState(
                          { artist: e.target.value })}/>
           <FormInput fieldName='album'
                      value={ album }
                      update={ e => this.setState(
                          { album: e.target.value })}/>
           <FormInput fieldName='year'
                      value={ year }
                      update={ e => this.setState(
                          { year: e.target.value })}/>
        )}
      </Form>
    )
  }

  _confirm = async data => {
    /* const { token } = this.state.login ? data.login : data.signup
     * this._saveUserData(token)
     * this.props.history.push(`/`)
     */ }

  _saveUserData = token => {
    /* localStorage.setItem(AUTH_TOKEN, token)*/
  }
}

export default CreateTrack