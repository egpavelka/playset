class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :email, Types::AuthProviderEmailInput
  end

  argument :name, !types.String
  argument :username, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_objs, args, _ctx)
    User.create!(
      name: args[:name],
      username: args[:username],
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password]
    )
  end

end
