class PlaysetteSchema < GraphQL::Schema
  mutation(Types::Mutation)
  query(Types::Query)
end
