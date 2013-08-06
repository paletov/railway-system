require 'path'
require 'cost'
require 'priority_queue'

class PathFinder
  attr_reader :edges

  def initialize(edges = {})
    @edges = edges
  end

  def find_path(start_railway_station_id, end_railway_station_id, comparator)
    queue, distance, previous, edges_by_railway_station_id = PriorityQueue.new, {}, {}, {}
    distance.default = Cost.max_value

    queue[start_railway_station_id] = Cost.empty
    distance[start_railway_station_id] = Cost.new(0, 0)
    previous[start_railway_station_id] = nil

    until queue.empty?
      curr_id, curr_edge_cost = queue.delete_min

      if @edges[curr_id] != nil
        @edges[curr_id].each do |direct_next_edge|
          next_id, next_cost = direct_next_edge.end_railway_station_id, Cost.from_edge(direct_next_edge)

          if comparator.compare(distance[next_id], distance[curr_id] + next_cost) == 1
            distance[next_id] = distance[curr_id] + next_cost
            previous[next_id], edges_by_railway_station_id[next_id], queue[next_id] = curr_id, direct_next_edge, distance[next_id]
          end
        end
      end
    end

    create_path(end_railway_station_id, previous, distance, edges_by_railway_station_id)
  end

  private

  def create_path(end_railway_station_id, previous, distance, edges_by_railway_station_id)
    edges_array = []
    railway_station_id = end_railway_station_id
    until previous[railway_station_id] == nil
      edges_array.push(edges_by_railway_station_id[railway_station_id])
      railway_station_id = previous[railway_station_id]
    end

    Path.new(edges_array.reverse, distance[end_railway_station_id])
  end
end