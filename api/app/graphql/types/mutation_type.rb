Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :signup, function: Resolvers::UserSignup.new
  field :login, function: Resolvers::UserLogin.new
end
