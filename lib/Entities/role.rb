require 'datamappify'
require 'user'
require 'role_validator'

class Role
  include Datamappify::Entity

  attribute :id, Integer
  attribute :name, String
  attribute :is_deleted, Boolean, :default => false

  has_many :users, :via => User

  validate :instance_validations

  def instance_validations
    validates_with RoleValidator
  end
end