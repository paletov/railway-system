require 'railway_station'
require 'railway_station_repository'

class RailwayStationController
  def create_or_update(railway_station)
    if railway_station.valid? then RailwayStationRepository.save(railway_station)
    end
  end

  def get_railway_stations(filter = {})
    RailwayStationRepository.where(filter)
  end

  def delete_railway_station(railway_station_id)
  end
end