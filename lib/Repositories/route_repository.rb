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

  references :edges, :via => EdgeRepository
end