Inputs::TrackInput = GraphQL::InputObjectType.define do
  name 'TrackInput'
  description 'An input object representing arguments for a track'

  argument :url, !types.String
  argument :media_url, types.String
  argument :media_query_url, types.String
  argument :service, !types.String
  argument :media_type, !types.String
  argument :title, !types.String
  argument :artist, !types.String
  argument :album, types.String
  argument :year, types.String
  argument :album_art_origin, types.String
end
