import React from 'react'
import { ApolloConsumer } from 'react-apollo'

const CurrentTrack - ({ current, track }) => (
    <ApolloConsumer>
    {client => (

    )}
    </ApolloConsumer>
)
// import { Mutation } from 'react-apollo'
// import gql from 'graphql-tag'

// const CURRENT_TRACK = gql`
//   mutation CurrentTrack($id: Int!) {
//     currentTrack(id: $id) @client
//   }
// `

// const CurrentTrack = ({ id, isPlaying, currentTime }) => (
//     <Mutation mutation={ CURRENT_TRACK } variables={{ id }}>
//     { currentTrack => (

//     )}
// )
