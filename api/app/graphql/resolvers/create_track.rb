class Resolvers::CreateTrack < GraphQL::Function
  argument :id, !types.ID
  argument :title, !types.String
  argument :artist, !types.String
  argument :album, !types.String
  argument :year, !types.Int
  argument :media_url, !types.String
  argument :source_service, !types.String
end
