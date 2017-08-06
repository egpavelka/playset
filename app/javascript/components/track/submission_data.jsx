import React from 'react'
import ReactDOM from 'react-dom'

const SubmissionData = props => (
  <div className='col-7 track-details'>
    <span>posted&nbsp;
      <text className='postedByText'>
        by <a href={'/users/' + props.userId }>{ props.user }</a>
      </text>
    </span>
    <span>
      <span className='postedByText'>&mdash;</span>
      { props.formattedTime } ago
    </span>
  </div>
)

const SubmissionDataUserProfile = props => {

}

export default SubmissionData
