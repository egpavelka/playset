import React from 'react'
import { Query } from 'react-apollo'
import gql from 'graphql-tag'

const QUERY = gql `
  query user($id: ID!){
    user(id: $id) {
      username
    }
  }
`

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
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error</p>;

      return (
        <div>
          { data.users.map(user => (
              <p key={user.id} value={user.username}>
                {user.username}
              </p>
              ))}
        </div>
      )
    }}
  </Query>
)

export default TestComponent
