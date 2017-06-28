import { createStore } from 'redux';
import trackReducer from '../reducers/trackReducer';

const configureStore = (railsProps) => (
  createStore(trackReducer, railsProps)
);

export default configureStore;
