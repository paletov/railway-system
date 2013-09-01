require 'db_integration_spec_helper'
require 'route_controller'

describe RailwayNetworkController do
  before :each do
    @routeController = RouteController.new
  end

  describe "#create_or_update" do
    it "creates" do
      route = Route.new
      route.name = "Test Route"
      route.company_name = "Test Route AD"
      route.id.should == nil
      route = @routeController.create_or_update(route)
      route.id.should_not == nil
    end

    it "updates" do
      route = @routeController.get_routes(:id => 1).first
      route.name.should_not == "Test Route Name"
      route.name = "Test Route Name"
      @routeController.create_or_update(route)
      route = @routeController.get_routes(:id => 1).first
      route.name.should == "Test Route Name"
    end
  end
end