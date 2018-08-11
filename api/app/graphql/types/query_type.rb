Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :users, !types[Types::UserType] do
    resolve -> (obj, args, ctx) { User.all }
  end

  field :tracks, !types[Types::TrackType] do
    resolve -> (obj, args, ctx) { Track.all }
  end

end
