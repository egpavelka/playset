class Resolvers::UserLogin < GraphQL::Function
  argument :username, !Types::AuthProviderUsernameInput

  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, ctx)
    input = args[:username]

    return unless input

    user = User.find_by username: input[:username]

    return unless user
    return unless user.authenticate(input[:password])

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id#{ user.id }")

    ctx[:session][:token] = token

    OpenStruct.new({
                     user: user,
                     token: token
                   })
  end
end
