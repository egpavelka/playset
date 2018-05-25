import * as types from '../constants/actionTypes'
import initialState from './initialState'

export default function trackReducer(state = initialState.tracks, action) {
  switch(action.type) {
    case types.PLAY_TRACK:
      return action.tracks
    default:
      return state
  }
}
