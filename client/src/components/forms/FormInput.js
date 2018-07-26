import React, { PropTypes } from 'react'
import { FormGroup, Label, Input } from 'reactstrap'

const FormInput = props => (
    <FormGroup>
      <Label for={ props.fieldName }>
        { props.label || props.fieldName }
      </Label>
      <Input name={ props.fieldName }
             type={ props.fieldType || 'text' }
             value={ props.value }
             onChange={ props.update } />
    </FormGroup>
)

export default FormInput
