module Mutations
  class SignInUser < BaseMutation
    null true
    argument :auth_data, Types::AuthDataInput, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(auth_data: nil)
      # basic validation
      user = User.find_by(email: auth_data[:email])

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(auth_data[:password])

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      # token = crypt.encrypt_and_sign("user-id:#{ user.id }")
      token = "123456"
      
      { user: user, token: token }
    end
  end
end