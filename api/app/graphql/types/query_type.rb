Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :users, !types[Types::UserType] do
    resolve -> (obj, args, ctx) { User.all }
  end

  field :tracks, !types[Types::TrackType] do
    resolve -> (obj, args, ctx) { Track.all }
  end

  field :track, !types[Types::TrackType] do
    argument :id, types.ID
    resolve -> (obj, args, ctx) { Track.where(id: args[:id]) }
  end

end
