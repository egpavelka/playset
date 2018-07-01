class Types::QueryType < GraphQL::Schema::Object
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user, Types::UserType, null: true do
    description "find a user by ID"
    argument :id, ID, required: true
  end

  def user(id:)
    User.find(id)
  end

  field :users, [Types::UserType], null: true

  def users
        User.all
  end
end

# field :track, Types::TrackType, null: true do
# end
