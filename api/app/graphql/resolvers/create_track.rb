class Resolvers::CreateTrack < GraphQL::Function
  name 'CreateTrack'

  argument :id, !types.ID
  argument :url, !types.String
  argument :media_url, !types.String
  argument :source_service, !types.String
  argument :media_type, !types.String
  argument :title, !types.String
  argument :artist, !types.String
  argument :album, !types.String
  argument :year, !types.Int

  type Types::TrackType

  # _obj is parent object (can be nil)
  # _ctx is graphql context
  def call(_obj, args, _ctx)
    Track.create!(
      url: args[url],
      media_url: args[:media_url],
      source_service: args[:source_service],
      media_type: args[:media_type],
      title: args[:title],
      artist: args[:artist],
      album: args[:album],
      year: args[:year],
      user: ctx[:current_user]
    )
  end
end
