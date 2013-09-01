require 'db_integration_spec_helper'
require 'railway_network_controller'

describe RailwayNetworkController do
  before :each do
    @railwayNetworkController = RailwayNetworkController.new
  end

  describe "#dijkstra" do
    it "works" do
      path = @railwayNetworkController.find_cheapest_path(2, 8)
      puts "start_railway_station_id = #{path.start_railway_station_id}, end_railway_station_id = #{path.end_railway_station_id}, start_datetime = #{path.start_datetime}, end_datetime = #{path.end_datetime}, cost = #{path.cost}"
    end
  end
end