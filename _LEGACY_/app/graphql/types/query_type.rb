Types::Query < Types::BaseObject
  name 'Query'

  field :allTracks, !types[Types::Track] do
    resolve -> (obj, args, ctx) { Track.all }
  end
end
