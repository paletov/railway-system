require 'datamappify'
require 'route'
require 'edge_repository'

class RouteRepository
  include Datamappify::Repository

  for_entity Route
  default_provider :ActiveRecord

  map_attribute :id, :to => 'Route#id'
  map_attribute :name, :to => 'Route#name'
  map_attribute :company_name, :to => 'Route#company_name'
  map_attribute :is_deleted, :to => "Route#is_deleted"

  references :edges, :via => EdgeRepository
end