require 'cost'
require 'edge'

class Path
  attr_reader :edges
  attr_reader :start_railway_station_id, :end_railway_station_id
  attr_reader :start_datetime, :end_datetime, :cost

  def initialize(edges, cost)
    if (edges) then
      @edges = edges
      @start_railway_station_id = edges.first.start_railway_station_id
      @end_railway_station_id = edges.last.end_railway_station_id
      @start_datetime = edges.first.start_datetime
      @end_datetime = edges.last.end_datetime
    end
    @cost = cost unless !cost
  end
end