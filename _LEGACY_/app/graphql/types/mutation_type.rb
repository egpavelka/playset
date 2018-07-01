class Types::Mutation < Types::BaseObject
  name 'Mutation'

  field :createTrack, function: Resolvers::CreateTrack.new
end
