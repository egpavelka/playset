const BANDCAMP_MUTATION = gql`
  mutation BandcampMutation($url: String!) {
    new_track(url: $url) {
      audio
    }
  }
`

const SOUNDCLOUD_MUTATION = gql`
  mutation SoundcloudMutation($url: String!) {
    new_track(url: $url) {
      audio
    }
  }`
