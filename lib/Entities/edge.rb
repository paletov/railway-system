require 'datamappify'
require 'edge_validator'

class Edge
  include Datamappify::Entity
  include Datamappify::Lazy

  attribute :id, Integer
  references :route
  attribute :number_in_route, Integer
  references :start_railway_station
  references :end_railway_station
  attribute :start_datetime, DateTime
  attribute :end_datetime, DateTime
  attribute :price, Integer
  attribute :is_deleted, Boolean, :default => false

  belongs_to :route

  validate :instance_validations

  def instance_validations
    validates_with EdgeValidator
  end
end