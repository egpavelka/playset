import React from 'react'
import ReactDOM from 'react-dom'

const PlayButton = props => (
  <div className="col-4 justify-content-center track-play-button" id={ `play-track-` + props.id }>
    <span className={ `fa fa-` + props.nextAction } aria-hidden="true"></span>
  </div>
)

export default PlayButton
