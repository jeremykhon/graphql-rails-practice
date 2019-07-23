module Types
  class AuthDataInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'AUTH_DATA_INPUT'
    # argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
  end
end