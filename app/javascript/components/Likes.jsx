import React from 'react'
import ReactDOM from 'react-dom'

class Likes extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className="col track-social">
        <div className="row no-gutters align-items-center justify-content-end">
          <span className="col social-col">
            <span className="fa fa-comment track-comment-button" aria-hidden="true"></span>
            <span className="col track-comment-count">23</span>
          </span>
          <span className="col social-col">
            <span className={`fa fa-heart track-like-button ` + this.props.likedState } aria-hidden="true"></span>
            <span className="col track-like-count">45</span>
          </span>
        </div>
      </div>
    )
  }
}

export default Likes
