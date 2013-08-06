require 'edge'
require 'edge_repository'
require 'priority_queue'
require 'edge_repository'
require 'path_finder'
require 'price_cost_comparator'
require 'price_time_cost_comparator'
require 'time_cost_comparator'
require 'time_price_cost_comparator'

class RailwayNetworkController
  public

  def find_shortest_path(start_railway_station_id, end_railway_station_id)
    path_finder = get_path_finder

    comparator = TimeCostComparator.new
    path_finder.find_path(start_railway_station_id, end_railway_station_id, comparator)
  end

  def find_cheapest_path(start_railway_station_id, end_railway_station_id)
    path_finder = get_path_finder

    comparator = PriceCostComparator.new
    path_finder.find_path(start_railway_station_id, end_railway_station_id, comparator)
  end

  def find_shortest_among_cheapest_paths(start_railway_station_id, end_railway_station_id)
    path_finder = get_path_finder

    comparator = PriceTimeCostComparator.new
    path_finder.find_path(start_railway_station_id, end_railway_station_id, comparator)
  end

  def find_cheapest_among_shortest_paths(start_railway_station_id, end_railway_station_id)
    path_finder = get_path_finder

    comparator = TimePriceCostComparator.new
    path_finder.find_path(start_railway_station_id, end_railway_station_id, comparator)
  end

  private

  def get_edges
    edges = {}
    EdgeRepository.all.each do |edge|
      edges[edge.start_railway_station_id] ||= []
      edges[edge.start_railway_station_id] << edge
    end
    edges
  end

  def get_path_finder
    edges = get_edges
    path_finder = PathFinder.new(edges)
  end
end