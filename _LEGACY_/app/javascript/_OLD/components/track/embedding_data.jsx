import React from 'react'
import ReactDOM from 'react-dom'

const EmbeddingData = props => (
  <div className="col embedded-service"><img src={'/assets/service_icons/' +  props.sourceService + '.png'} />
    {
      props.playback == 'audio' ?
        null
        : <text className="embedded-type">{ props.playback }&nbsp;</text>
    }
    via <a href={ props.sourcePath }>{ props.sourceService }</a></div>
)

export default EmbeddingData
