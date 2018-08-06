import gql from 'graphql-tag'

const NEW_TRACK_MUTATION = gql`
  mutation NewTrackMutation($url: String!) {
    new_track(url: $url) @client
  }
`
const CREATE_TRACK_MUTATION = gql`
  mutation CreateTrackMutation(
    $url: string!,
    $service: string!,
    $mediaUrl: string!,
    $mediaType: string!,
    $title: string!
    $artist: string!,
    $album: string,
    $year: string) {
      create_track(
        url: $url,
        service: $service,
        media_type: $mediaType,
        media_url: $mediaUrl,
        title: $title,
        artist: $artist,
        album: $album,
        year: $year) {
          url
        }
    }
`
// fieldName: (obj, args, context, info) => result
const resolvers = {
  Mutation: {
    validateTrack: (_, args, { cache, getCacheKey }) => {
      const id = getCacheKey({ __typename: 'TrackSubmission', url: args.url })
      const fragment = gql`
        fragment completeTodo on TodoItem {
          completed
        }
      `;
      const todo = cache.readFragment({ fragment, id });
      const data = { ...todo, completed: !todo.completed };
      cache.writeData({ id, data });
      return null;
    },
  },
}

const validateTrack
