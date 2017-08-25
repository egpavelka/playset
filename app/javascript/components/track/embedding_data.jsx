import React from 'react'
import ReactDOM from 'react-dom'

const EmbeddingData = props => (
  <div className="col embedded-service"><img src={'/assets/service_icons/' +  props.sourceService + '.png'} />
    {
      props.isPreview ?
       <text className="embedded-type">PREVIEW&nbsp;</text>
       : null
    }
    via <a href={ props.sourcePath }>{ props.sourceService }</a></div>
)

export default EmbeddingData
