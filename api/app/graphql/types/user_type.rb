class Types::UserType < GraphQL::Schema::Object
  field :id, ID, null: false
  field :username, String, null: false
  field :email, String, null: false
  field :name, String, null: false
  field :password_digest, String, null: false
end
