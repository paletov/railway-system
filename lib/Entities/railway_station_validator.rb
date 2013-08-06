require 'base_validator'

class RailwayStationValidator < BaseValidator
  def validate(railway_station)
    valid = true
    valid &= validate_name(railway_station)
    valid
  end

  def validate_name(railway_station)
    if !validate_presence(railway_station.name, "name", railway_station) then false
    elsif !validate_type(railway_station.name, "name", String, "String", railway_station) then false
    else true
    end
  end
end