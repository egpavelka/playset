Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :signup, function: Resolvers::UserSignup.new
  field :login, function: Resolvers::UserLogin.new

  field :new_track, function: Resolvers::NewTrack.new
  field :create_track, function: Resolvers::CreateTrack.new
end
