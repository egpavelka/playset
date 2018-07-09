# class Types::QueryType < Types::BaseObject
#   graphql_name 'Query'

#   field :users, Types::UserType, null: false, description: "test"

#   def users
#     return User.first
#   end
# end

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :allUsers, !types[Types::UserType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { User.all }
  end
end
