require 'datamappify'
require 'edge'

class EdgeRepository
  include Datamappify::Repository

  for_entity Edge
  default_provider :ActiveRecord

  map_attribute :id, :to => 'Edge#id'
  map_attribute :route_id, :to => 'Edge#route_id'
  map_attribute :number_in_route, :to => 'Edge#number_in_route'
  map_attribute :start_railway_station_id, :to => 'Edge#start_railway_station_id'
  map_attribute :end_railway_station_id, :to => 'Edge#end_railway_station_id'
  map_attribute :start_datetime, :to => 'Edge#start_datetime'
  map_attribute :end_datetime, :to => 'Edge#end_datetime'
  map_attribute :price, :to => 'Edge#price'
end