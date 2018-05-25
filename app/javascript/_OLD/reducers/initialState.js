import * as actionTypes from '../actions/actionTypes';]

const initialState = [];

const rootReducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.TRACKS_SET:
      return setTracks(state, action)
  }
  return state;
};

export default rootReducer;
