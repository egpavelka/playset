# class Types::UserType < Types::BaseObject
#   graphql_name 'User'

#   field :name, String, null: true
#   field :username, String, null: true
#   field :email, String, null: true
# end

Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :username, !types.String
  field :name, !types.String
  field :email, !types.String
end
