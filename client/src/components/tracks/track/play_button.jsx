import React from 'react'
import ReactDOM from 'react-dom'

const PlayButton = props => (
  <div className={`col-3 justify-content-center track-play-button ` + props.isPlaying } id={ `play-track-` + props.id }>
    <span className={ `fa fa-` + props.nextAction } aria-hidden="true"></span>
  </div>
)

export default PlayButton
