import * from '../actions/actionTypes';

const initialState = {
  tracks: [],
  currentTrack: {}
};

const rootReducer = (state = initialState, action) => {
  switch (action.type) {
    default:
      return state;
    
  }
};

export default rootReducer;
