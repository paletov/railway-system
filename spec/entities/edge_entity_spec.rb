require 'spec_helper'
require 'edge'
require 'edge_validator'

describe Edge do
  before :each do
    @edge = Edge.new
    @edge_validator = EdgeValidator.new
  end

  describe "#id" do
    it "is defined" do
      @edge.should respond_to("id")
    end
  end

  describe "#route_id" do
    it "is defined" do
      @edge.should respond_to("route_id")
    end

    it "has to be set" do
      @edge.route_id = nil
      @edge_validator.validate_route_id(@edge).should be_false
      @edge.route_id = 1
      @edge_validator.validate_route_id(@edge).should be_true
    end
  end

  describe "#number_in_route" do
    it "is defined" do
      @edge.should respond_to("number_in_route")
    end

    it "has to be set" do
      @edge.number_in_route = nil
      @edge_validator.validate_number_in_route(@edge).should be_false
      @edge.number_in_route = 1
      @edge_validator.validate_number_in_route(@edge).should be_true
    end
  end

  describe "#route" do
    it "is defined" do
      @edge.should respond_to("route")
    end
  end

  describe "#start_railway_station_id" do
    it "is defined" do
      @edge.should respond_to("start_railway_station_id")
    end

    it "has to be set" do
      @edge.start_railway_station_id = nil
      @edge_validator.validate_start_railway_station_id(@edge).should be_false
      @edge.start_railway_station_id = 1
      @edge_validator.validate_start_railway_station_id(@edge).should be_true
    end
  end

  describe "#start_railway_station" do
    it "is defined" do
      @edge.should respond_to("start_railway_station")
    end
  end

  describe "#end_railway_station_id" do
    it "is defined" do
      @edge.should respond_to("end_railway_station_id")
    end

    it "has to be set" do
      @edge.end_railway_station_id = nil
      @edge_validator.validate_end_railway_station_id(@edge).should be_false
      @edge.end_railway_station_id = 1
      @edge_validator.validate_end_railway_station_id(@edge).should be_true
    end
  end

  describe "#end_railway_station" do
    it "is defined" do
      @edge.should respond_to("end_railway_station")
    end
  end

  describe "#start_datetime" do
    it "is defined" do
      @edge.should respond_to("start_datetime")
    end

    it "has to be set and before the end_datetime" do
      @edge.start_datetime = nil
      @edge_validator.validate_start_datetime(@edge).should be_false

      @edge.end_datetime = DateTime.now
      @edge.start_datetime = @edge.end_datetime + 10000
      @edge_validator.validate_start_datetime(@edge).should be_false

      @edge.end_datetime = DateTime.now
      @edge.start_datetime = @edge.end_datetime - 10000
      @edge_validator.validate_start_datetime(@edge).should be_true
    end
  end

  describe "#end_datetime" do
    it "is defined" do
      @edge.should respond_to("end_datetime")
    end

    it "has to be set and after the start_datetime" do
      @edge.end_datetime = nil
      @edge_validator.validate_end_datetime(@edge).should be_false

      @edge.start_datetime = DateTime.now
      @edge.end_datetime = @edge.start_datetime - 10000
      @edge_validator.validate_end_datetime(@edge).should be_false

      @edge.start_datetime = DateTime.now
      @edge.end_datetime = @edge.start_datetime + 10000
      @edge_validator.validate_end_datetime(@edge).should be_true
    end
  end

  describe "#price" do
    it "is defined" do
      @edge.should respond_to("price")
    end

    it "has to be set" do
      @edge.price = nil
      @edge_validator.validate_price(@edge).should be_false
      @edge.price = 1
      @edge_validator.validate_price(@edge).should be_true
    end
  end
end