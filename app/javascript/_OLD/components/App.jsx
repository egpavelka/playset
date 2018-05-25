import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
// import actions
import TrackList from './TrackList'
import Playbar from './Playbar'

const App = () => (
  <section>
    <TrackList />
    <Playbar />
  </section>
)

const mapStateToProps = state => {
  return {
    state
  }
}

const mapDispatchToProps = dispatch => {
    return {
      actions: bindActionCreators(actions, dispatch)
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(App)
