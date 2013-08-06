require 'spec_helper'
require 'path_finder'
require 'edge'
require 'path'
require 'price_cost_comparator'

describe PathFinder do
  before :each do
    edges = create_test_edges
    @path_finder = PathFinder.new(edges)
  end

  describe "#find_path" do
    it "is defined" do
      @path_finder.should respond_to("find_path")
    end

    it "calculates the cost properly" do
      path = @path_finder.find_path(2, 8, PriceCostComparator.new)
      path.start_railway_station_id.should == 2
      path.end_railway_station_id.should == 8
      path.cost.price.should == 6600
    end
  end

  def create_test_edges
    datetime = DateTime.now + 1.days
    edges = {}
    # Edges for route 1
    append_edge(edges, create_test_edge(2, 3, datetime + 0.minutes, datetime + 90.minutes, 800))
    append_edge(edges, create_test_edge(3, 4, datetime + 100.minutes, datetime + 200.minutes.minutes, 1000))
    append_edge(edges, create_test_edge(4, 12, datetime + 205.minutes, datetime + 295.minutes, 1800))
    # Edges for route 2
    append_edge(edges, create_test_edge(2, 3, datetime + 0.minutes, datetime + 90.minutes, 800))
    # Edges for route 3
    append_edge(edges, create_test_edge(1, 2, datetime + 70.minutes, datetime + 90.minutes, 1200))
    append_edge(edges, create_test_edge(2, 3, datetime + 0.minutes, datetime + 90.minutes, 800))
    append_edge(edges, create_test_edge(3, 7, datetime + 190.minutes, datetime + 220.minutes, 1200))
    # Edges for route 4
    append_edge(edges, create_test_edge(2, 6, datetime + 0.minutes, datetime + 90.minutes, 800))
    append_edge(edges, create_test_edge(6, 7, datetime + 110.minutes, datetime + 200.minutes, 1500))
    append_edge(edges, create_test_edge(7, 11, datetime + 230.minutes, datetime + 290.minutes, 1000))
    append_edge(edges, create_test_edge(11, 13, datetime + 300.minutes, datetime + 400.minutes, 1700))
    # Edges for route 5
    append_edge(edges, create_test_edge(13, 10, datetime + 40.minutes, datetime + 110.minutes, 1700))
    # Edges for route 6
    append_edge(edges, create_test_edge(13, 12, datetime + 150.minutes, datetime + 290.minutes, 2000))
    append_edge(edges, create_test_edge(12, 4, datetime + 300.minutes, datetime + 370.minutes, 1700))
    # Edges for route 7
    append_edge(edges, create_test_edge(2, 5, datetime + 5.minutes, datetime + 70.minutes, 600))
    append_edge(edges, create_test_edge(5, 6, datetime + 75.minutes, datetime + 90.minutes, 300))
    # Edges for route 8
    append_edge(edges, create_test_edge(5, 2, datetime + 50.minutes, datetime + 50.minutes, 900))
    append_edge(edges, create_test_edge(2, 1, datetime + 120.minutes, datetime + 160.minutes, 800))
    # Edges for route 9
    append_edge(edges, create_test_edge(5, 7, datetime + 0.minutes, datetime + 70.minutes, 900))
    append_edge(edges, create_test_edge(7, 4, datetime + 80.minutes, datetime + 180.minutes, 1100))
    append_edge(edges, create_test_edge(4, 12, datetime + 210.minutes, datetime + 300.minutes, 1500))
    append_edge(edges, create_test_edge(12, 13, datetime + 310.minutes, datetime + 390.minutes, 2100))
    append_edge(edges, create_test_edge(13, 8, datetime + 410.minutes, datetime + 500.minutes, 2400))
    # Edges for route 10
    append_edge(edges, create_test_edge(10, 13, datetime + 120.minutes, datetime + 210.minutes, 1900))
    append_edge(edges, create_test_edge(13, 12, datetime + 220.minutes, datetime + 290.minutes, 1900))
    edges
  end

  def append_edge(edges, edge)
    if !edges.has_key?(edge.start_railway_station_id)
      edges[edge.start_railway_station_id] ||= []
    end
    edges[edge.start_railway_station_id] << edge
  end

  def create_test_edge(start_railway_station_id, end_railway_station_id,
    start_datetime, end_datetime, price)
    edge = Edge.new
    edge.start_railway_station_id = start_railway_station_id
    edge.end_railway_station_id =end_railway_station_id
    edge.start_datetime = start_datetime
    edge.end_datetime = end_datetime
    edge.price = price
    edge
  end
end