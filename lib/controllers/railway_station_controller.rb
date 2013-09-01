require 'railway_station'
require 'railway_station_repository'

class RailwayStationController
  def create_or_update(railway_station)
    if railway_station.valid? then RailwayStationRepository.save(railway_station)
    end
  end

  def get_railway_stations(filter = {})
    filter[:is_deleted] = false
    RailwayStationRepository.where(filter)
  end

  def delete_railway_station(id)
    railway_station = RailwayStationRepository.where(:id => id)
    railway_station.is_deleted = true
    RailwayStationRepository.save(railway_station)
  end
end