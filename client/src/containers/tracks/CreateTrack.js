import React from 'react'
import { Button, Form } from 'reactstrap'
import FormInput from '../../components/forms/FormInput'
import { Mutation } from 'react-apollo'
import { NEW_TRACK_MUTATION, CREATE_TRACK_MUTATION } from './graphql/trackMutations'

class CreateTrack extends React.Component {
  state = {
    valid: false,
    url: '',
    mediaUrl: '',
    mediaQueryUrl: '',
    service: '',
    mediaType: '',
    title: '',
    artist: '',
    album: '',
    year: '',
    albumArtOrigin: ''
  }

  render () {
    const { valid, url, mediaUrl, mediaQueryUrl, service, mediaType, title, artist, album, year, albumArtOrigin } = this.state
    return (
      <Form>
        <h4>{ valid ? 'Verify track information' : 'Submit track link'}</h4>
        {!valid && (
           <FormInput fieldName='url'
                      value={ url }
                      update={ e => this.setState(
                          { url: e.target.value })}/>
        )}
        {valid && (
           <section>
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
           </section>
        )}

        <Mutation mutation={ valid ? CREATE_TRACK_MUTATION : NEW_TRACK_MUTATION }
                  variables={{ url, service, mediaUrl, mediaQueryUrl, mediaType, title, artist, album, year, albumArtOrigin }}
                  onCompleted={ data => this._confirm(data) }>
          { mutation => (
            <Button onClick={ mutation }>
              {valid ? 'confirm' : 'submit'}
            </Button>
          )}
        </Mutation>

      </Form>
    )
  }

  _confirm = async data => {

    if(!this.state.valid) {
      var info = data.new_track

      this.setState({ valid: true, url: info.url, mediaUrl: info.media_url, mediaQueryUrl: info.media_query_url, mediaType: info.media_type, service: info.service, title: info.title, artist: info.artist, album: info.album, year: info.year, albumArtOrigin: info.album_art_origin })
    } else {
      this.props.history.push('/')
    }
  }
}

export default CreateTrack
