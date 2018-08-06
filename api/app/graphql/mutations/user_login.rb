class Mutations::UserLogin < GraphQL::Function
  argument :username, !Types::AuthProviderUsernameInput

  types Types::AuthenticateType

  def call(obj, args, ctx)
    input = args[:username]
    return unless input

    user = User.find_by(username: input[:username])
    return unless user
    return unless user.authenticate(input[:password])

    OpenStruct.new({
                     token: AuthToken.token(user),
                     user: user
                   })
  end
end
