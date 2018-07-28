class Resolvers::UserSignup < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :username, Types::AuthProviderUsernameInput
  end

  argument :email, !types.String
  argument :name, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_objs, args, _ctx)
    User.create!(
      username: args[:authProvider][:username][:username],
      email: args[:email],
      name: args[:name],
      password: args[:authProvider][:email][:password]
    )
  end

end
