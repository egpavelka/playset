Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :signup, function: Resolvers::UserSignup.new
  field :login, function: Resolvers::UserLogin.new

  field :createTrack, function: Resolvers::CreateTrack.new
end
