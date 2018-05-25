import { combineReducers } from 'redux'
import { routerReducer } from 'react-router-redux'
import messageReducer from './message'

const rootReducer = combineReducers({
  messageReducer,
  router: routerReducer
})

export default rootReducer
