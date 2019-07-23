module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :auth_data, Types::AuthDataInput, required: true
    type Types::UserType

    def resolve(name:, auth_data:)
      User.create!(
        name: name,
        email: auth_data[:email],
        password: auth_data[:password]
      )
    end
  end
end