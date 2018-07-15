Types::TrackType = GraphQL::ObjectType.define do
  name 'Track'

  field :id, !types.ID
  field :title, !types.String
  field :artist, !types.String
  field :album, !types.String
  field :year, !types.Int
  field :media_url, !types.String
  field :source_service, !types.String
end
