import React from 'react'
import ReactDOM from 'react-dom'

const SubmissionData = props => (
  <div className='col-9 track-details'>
    <span>posted&nbsp;
      {
        window.location.href.includes(`/users/${ props.userId }`) ?
        null
        : <text>
            by <a href={`/users/${ props.userId }`}>{ props.user }</a> &mdash;
          </text>
      }
    </span>
    <span>
      { props.formattedTime } ago
    </span>
  </div>
)

export default SubmissionData
