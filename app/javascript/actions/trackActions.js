import * as types from '../constants/actionTypes'

export function setCurrent(track) {

}

export const playTrack = track => {

}

export const setAudio = () => {
  if (this.props.embeddedService == 'Soundcloud') {
    this._setSoundcloudUrl()
  } else {
    this.setState({ trackAudio: new Audio(this.props.track.media_path), audioLoaded: true }, () => { this._setListenersOnAudioLoad() })
  }
}

export function setListenersOnAudioLoad() {
  this.state.trackAudio.addEventListener('pause', this._setStatesOnPause)
  this.state.trackAudio.addEventListener('play', this._setStatesOnPlay)
  this.state.trackAudio.addEventListener('timeupdate',
  (t) => { this.setState({ timePlayed: t }) }
  )
}

export function setSoundcloudUrl() {
  var callUrl = this.props.track.media_path + '?client_id=' +  soundcloudPublicClientId
  fetch(callUrl)
  .then((response) => {
    this.setState({ trackAudio: new Audio(response.url),  audioLoaded: true },
    () => { this._setListenersOnAudioLoad() })
  })
  .catch((error) => { console.log(error) })
}
