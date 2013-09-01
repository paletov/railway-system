require 'datamappify'
require 'role'
require 'user_repository'

class RoleRepository
  include Datamappify::Repository

  for_entity Role
  default_provider :ActiveRecord

  map_attribute :id, :to => 'Role#id'
  map_attribute :name, :to => 'Role#name'
  map_attribute :is_deleted, :to => "Role#is_deleted"

  references :users, :via => UserRepository
end