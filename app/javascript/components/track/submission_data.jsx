import React from 'react'
import ReactDOM from 'react-dom'

const SubmissionData = props => (
  <div className="col-xs-7 track-details">posted by <a href={'/users/' + props.userId }>{ props.user }</a> --- { props.formattedTime } ago</div>
)

export default SubmissionData
