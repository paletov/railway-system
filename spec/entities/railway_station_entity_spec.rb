require 'spec_helper'
require 'railway_station'
require 'railway_station_validator'

describe RailwayStation do
  before :each do
    @railway_station = RailwayStation.new
    @railway_station_validator = RailwayStationValidator.new
  end

  describe "#id" do
    it "is defined" do
      @railway_station.should respond_to("id")
    end
  end

  describe "#name" do
    it "is defined" do
      @railway_station.should respond_to("name")
    end

    it "has to be set" do
      @railway_station.name = nil
      @railway_station_validator.validate_name(@railway_station).should be_false

      @railway_station.name = "TestRailwayStation"
      @railway_station_validator.validate_name(@railway_station).should be_true
    end
  end

  describe "#x" do
    it "is defined" do
      @railway_station.should respond_to("x")
    end
  end

  describe "#y" do
    it "is defined" do
      @railway_station.should respond_to("y")
    end
  end
end