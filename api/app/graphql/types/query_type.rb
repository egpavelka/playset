Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :users, !types[Types::UserType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { User.all }
  end

  field :tracks, !types[Types::TrackType] do
    resolve -> (obj, args, ctx) { Track.all }
  end

  field :tracktest, !types[Types::TrackType] do
    resolve -> (obj, args, ctx) { Track.test_this }
  end
end
