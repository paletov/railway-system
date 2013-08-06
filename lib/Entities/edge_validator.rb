require 'base_validator'

class EdgeValidator < BaseValidator
  def validate(edge)
    valid = true
    valid &= validate_route_id(edge)
    valid &= validate_number_in_route(edge)
    valid &= validate_start_railway_station_id(edge)
    valid &= validate_end_railway_station_id(edge)
    valid &= validate_start_datetime(edge)
    valid &= validate_end_datetime(edge)
    valid &= validate_price(edge)
    valid
  end

  def validate_route_id(edge)
    if !validate_presence(edge.route_id, "route_id", edge) then false
    elsif !validate_type(edge.route_id, "route_id", Integer, "Integer", edge) then false
    else true
    end
  end

  def validate_number_in_route(edge)
    if !validate_presence(edge.number_in_route, "number_in_route", edge) then false
    elsif !validate_type(edge.number_in_route, "number_in_route", Integer, "Integer", edge) then false
    else true
    end
  end

  def validate_start_railway_station_id(edge)
    if !validate_presence(edge.start_railway_station_id, "start_railway_station_id", edge) then false
    elsif !validate_type(edge.start_railway_station_id, "start_railway_station_id", Integer, "Integer", edge) then false
    else true
    end
  end

  def validate_end_railway_station_id(edge)
    if !validate_presence(edge.end_railway_station_id, "end_railway_station_id", edge) then false
    elsif !validate_type(edge.end_railway_station_id, "end_railway_station_id", Integer, "Integer", edge) then false
    else true
    end
  end

  def validate_start_datetime(edge)
    if !validate_presence(edge.start_datetime, "start_datetime", edge) then false
    elsif !validate_type(edge.start_datetime, "start_datetime", DateTime, "DateTime", edge) then false
    elsif edge.end_datetime != nil && edge.start_datetime >= edge.end_datetime then false
    else true
    end
  end

  def validate_end_datetime(edge)
    if !validate_presence(edge.end_datetime, "end_datetime", edge) then false
    elsif !validate_type(edge.end_datetime, "end_datetime", DateTime, "DateTime", edge) then false
    elsif edge.start_datetime != nil && edge.end_datetime <= edge.start_datetime then false
    else true
    end
  end

  def validate_price(edge)
    if !validate_presence(edge.price, "price", edge) then false
    elsif !validate_type(edge.price, "price", Integer, "Integer", edge) then false
    else true
    end
  end
end