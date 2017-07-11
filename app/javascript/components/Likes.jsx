import React from 'react'
import ReactDOM from 'react-dom'

class Likes extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className="track-likes"><span className="track-like-button"><span className="glyphicon glyphicon-heart" aria-hidden="true"></span></span>
      <span className="track-like-count">450</span></div>
    )
  }
}

export default Likes
