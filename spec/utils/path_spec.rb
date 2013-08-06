require 'spec_helper'
require 'path'

describe Path do
  before :each do
    @path = Path.new(nil, 0)
  end

  describe "#edges" do
    it "is defined" do
      @path.should respond_to("edges")
    end
  end

  describe "#start_railway_station_id" do
    it "is defined" do
      @path.should respond_to("start_railway_station_id")
    end
  end

  describe "#end_railway_station_id" do
    it "is defined" do
      @path.should respond_to("end_railway_station_id")
    end
  end

  describe "#start_datetime" do
    it "is defined" do
      @path.should respond_to("start_datetime")
    end
  end

  describe "#end_datetime" do
    it "is defined" do
      @path.should respond_to("end_datetime")
    end
  end

  describe "#cost" do
    it "is defined" do
      @path.should respond_to("cost")
    end
  end
end