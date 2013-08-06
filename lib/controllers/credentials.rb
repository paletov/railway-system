require 'password_string'

class Credentials
  include Virtus

  attribute :name, String
  attribute :password, PasswordString
end