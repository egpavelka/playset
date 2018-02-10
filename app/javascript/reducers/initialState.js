import * from '../actions/actionTypes'

const initialState = {
  tracks: [],
  currentTrack: {}
}

export default const rootReducer = (state = initialState, action) => {
  switch (action.type) {
    case: PLAY_TRACK:
      return { ...state, tracks:}
  }
}
