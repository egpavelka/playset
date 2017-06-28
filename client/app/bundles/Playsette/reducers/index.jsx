import trackReducer from './trackReducer';
// import blogPostsReducer from './blogPostsReducer';
// import commentsReducer from './commentsReducer';
// ...

import { $$initialState as $$tracksState } from './trackReducer';
// import { $$initialState as $$blogPostsState } from './blogPostsReducer';
// import { $$initialState as $$commentsState } from './commentsReducer';
// ...

export default {
  $$trackStore: trackReducer,
  // $$blogPostsStore: blogPostsReducer,
  // $$commentsStore: commentsReducer,
  // ...
};

export const initialStates = {
  $$trackState,
  // $$blogPostsState,
  // $$commentsState,
  // ...
};
