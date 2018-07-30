class Resolvers::NewTrack < GraphQL::Function
  name 'NewTrack'

  argument :id, !types.ID
  argument :url, !types.String
  argument :media_url, !types.String
  argument :service, !types.String
  argument :media_type, !types.String
  argument :title, !types.String
  argument :artist, !types.String
  argument :album, !types.String
  argument :year, !types.Int

  # _obj is parent object (can be nil)
  # _ctx is graphql context
  def call(_obj, args, _ctx)
    service = EmbeddingUtil.set_service(args[:url])
    track = EmbeddedTrackService.new(url: args[:url], service: service)
    {
      url: args[:url],
      media_url:  track.media_url,
      service: service,
      media_type: track.media_type,
      title: track.title,
      artist: track.title,
      album: track.album,
      year: track.year_params
    }
  end
end
