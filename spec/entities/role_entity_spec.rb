require 'spec_helper'
require 'role'
require 'role_validator'

describe Role do
  before :each do
    @role = Role.new
    @role_validator = RoleValidator.new
  end

  describe "#id" do
    it "is defined" do
      @role.should respond_to("id")
    end
  end

  describe "#name" do
    it "is defined" do
      @role.should respond_to("name")
    end

    it "has to be set" do
      @role.name = nil
      @role_validator.validate_name(@role).should be_false

      @role.name = "Admin"
      @role_validator.validate_name(@role).should be_true
    end
  end
end