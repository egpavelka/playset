class Resolvers::CreateTrack < GraphQL::Function

  argument :url, !types.String
  argument :media_url, !types.String
  argument :service, !types.String
  argument :media_type, !types.String
  argument :title, !types.String
  argument :artist, !types.String
  argument :album, types.String
  argument :year, types.String
  argument :album_art_origin, types.String
  # argument :user, Types::UserType

  type Types::TrackType

  # _obj is parent object (can be nil)
  # _ctx is graphql context
  def call(_obj, args, ctx)
    Track.create!(
      url: args[:url],
      media_url: args[:media_url],
      service: args[:service],
      media_type: args[:media_type],
      title: args[:title],
      artist: args[:artist],
      album: args[:album],
      year: args[:year],
      album_art_origin: args[:album_art_origin],
      # user: ctx[:current_user]
      user_id: "1"
    )
  end
end
