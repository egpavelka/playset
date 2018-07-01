class Types::MutationType < GraphQL::Schema::Object

  field :user, String, null: false,
        description: "An example field added by the generator"
  field :users, Types::UserType, null: false
  def test_field
    "Hello World"
  end
end
