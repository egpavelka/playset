import React, { Component } from 'react'
import InputPreview from '../components/InputPreview'
import Header from '../components/Header'
import Footer from '../components/Footer'
import { setMessage } from '../actions/message'
import { connect } from 'react-redux'

class App extends Component {
  _onChange = (value) => {
    this.props.dispatch(setMessage(value))
  }

  render () {
    const { message } = this.props.messageReducer
    return (
      <div>
        <Header />
        <InputPreview value={ message } onChange={ this._onChange }/>
        <Footer />
      </div>
    )
  }
}

export default connect(state => state)(App)
