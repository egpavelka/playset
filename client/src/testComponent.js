import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'

/* const QUERY = gql `
 *   query user($id: ID!){
 *     user(id: $id) {
 *       username
 *     }
 *   }
 * `*/

const GET_USERS = gql `
    {
        users {
            id
            username
        }
    }`

const TestComponent = () => (
    <Query query={ GET_USERS }>
    {({ loading, error, data })  => {
      if (loading) return "Loading...";
      if (error) return `Error! ${ error.message }`;
       
       return data.users.map(({ id, username }) => (
         <div key={id}>
         {`${id}: ${username}`}
         </div>
       ))
    }}
  </Query>
)

export default TestComponent
