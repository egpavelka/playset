import React from 'react'
import ReactDOM from 'react-dom'

const PlayButton = props => (
  <div className="track-play-button" id={ `play-track-` + props.id }>
    <span className={ `glyphicon glyphicon-` + props.nextAction } aria-hidden="true"></span>
  </div>
)

export default PlayButton

/*
glyphicon-music
glyphicon-film
glyphicon-pause
*/
