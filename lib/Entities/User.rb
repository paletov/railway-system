require 'datamappify'
require 'password_string'
require 'user_validator'

class User
  include Datamappify::Entity
  include Datamappify::Entity::Association
  include Datamappify::Lazy

  attribute :id, Integer
  attribute :name, String
  attribute :password, PasswordString
  references :role

  belongs_to :role

  validate :instance_validations

  def instance_validations
    validates_with UserValidator
  end
end