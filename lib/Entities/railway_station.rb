require 'datamappify'
require 'railway_station_validator'

class RailwayStation
  include Datamappify::Entity

  attribute :id, Integer
  attribute :name, String
  attribute :x, Decimal
  attribute :y, Decimal
  attribute :is_deleted, Boolean, :default => false

  validate :instance_validations

  def instance_validations
    validates_with RailwayStationValidator
  end
end