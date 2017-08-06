import React from 'react'
import ReactDOM from 'react-dom'

const EmbeddingData = props => (
  <div className="col embedded-service"><img src={'/assets/service_icons/' +  props.sourceService + '.png'} />via <a href={ props.sourcePath }>{ props.sourceService }</a></div>
)

export default EmbeddingData
