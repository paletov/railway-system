require 'spec_helper'
require 'route'
require 'route_validator'

describe Route do
  before :each do
    @route = Route.new
    @route_validator = RouteValidator.new
  end

  describe "#id" do
    it "is defined" do
      @route.should respond_to("id")
    end
  end

  describe "#name" do
    it "is defined" do
      @route.should respond_to("name")
    end

    it "has to be set" do
      @route.name = nil
      @route_validator.validate_name(@route).should be_false

      @route.name = "TestRoute"
      @route_validator.validate_name(@route).should be_true
    end
  end

  describe "#company_name" do
    it "is defined" do
      @route.should respond_to("company_name")
    end

    it "has to be set" do
      @route.company_name = nil
      @route_validator.validate_company_name(@route).should be_false

      @route.company_name = "EnterpriseAD"
      @route_validator.validate_company_name(@route).should be_true
    end
  end
end
