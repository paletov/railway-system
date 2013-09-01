require 'datamappify'
require 'railway_station'

class RailwayStationRepository
  include Datamappify::Repository

  for_entity RailwayStation
  default_provider :ActiveRecord

  map_attribute :id, :to => 'RailwayStation#id'
  map_attribute :name, :to => 'RailwayStation#name'
  map_attribute :x, :to => 'RailwayStation#x'
  map_attribute :y, :to => 'RailwayStation#y'
  map_attribute :is_deleted, :to => "RailwayStation#is_deleted"
end