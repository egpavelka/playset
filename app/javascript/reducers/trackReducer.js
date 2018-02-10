import * as types from '../constants/actionTypes'
import initialState from './initialState'

export default function trackReducer(state = initialState.tracks, action) {
  switch(action.type) {
    case types.LOAD_TRACKS_SUCCESS:
      return action.tracks
    default:
      return state
  }
}
