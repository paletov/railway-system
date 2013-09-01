require 'datamappify'
require 'user'

class UserRepository
  include Datamappify::Repository

  for_entity User
  default_provider :ActiveRecord

  map_attribute :id, :to => 'User#id'
  map_attribute :name, :to => 'User#name'
  map_attribute :password, :to => 'User#password'
  map_attribute :role_id, :to => 'User#role_id'
  map_attribute :is_deleted, :to => "User#is_deleted"
end