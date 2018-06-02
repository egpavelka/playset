import React from 'react';
import ReactDOM from 'react-dom';
import 'bootstrap/dist/js/bootstrap'
import { Provider } from 'react-redux'
import AppRoutes from './routes'
import store from './store'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={ store }>
      <AppRoutes />
    </Provider>,
    document.getElementById('playsette-app')
  )
})