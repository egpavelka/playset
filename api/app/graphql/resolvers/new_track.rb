class Resolvers::NewTrack < GraphQL::Function
  argument :url, !types.String
  type do
    name 'TrackPayload'
    field :url, !types.String
    field :media_url, !types.String
    field :service, !types.String
    field :media_type, !types.String
    field :title, types.String
    field :artist, types.String
    field :album, types.String
    field :year, types.String
    field :artwork_url, types.String
  end

  # _obj is parent object (can be nil)
  # _ctx is graphql context
  def call(_obj, args, ctx)
    url = args[:url]

    return unless url

    service = EmbeddingUtil.set_service(url)
    # reject unrecognized url
    return unless service

    track = EmbeddedTrackService.new(url: url, service: service).perform

    OpenStruct.new({
                     url: url,
                     service: service,
                     media_url:  track[:media_url],
                     media_type: track[:media_type],
                     title: track[:title],
                     artist: track[:artist],
                     album: track[:album],
                     year: track[:year],
                     artwork_url: track[:artwork_url]
                   })
  end
end
