class Types::MutationType < GraphQL::Schema::Object
  graphql_name 'Mutation'

  field :test_field, String, null: false,
        description: "An example field generator"
  def test_field
    "Hello World"
  end
end
