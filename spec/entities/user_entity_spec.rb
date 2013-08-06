require 'spec_helper'
require 'user'
require 'user_validator'

describe User do
  before :each do
    @user = User.new
    @user_validator = UserValidator.new
  end

  describe "#id" do
    it "is defined" do
      @user.should respond_to("id")
    end
  end

  describe "#name" do
    it "is defined" do
      @user.should respond_to("name")
    end

    it "has to be set" do
      @user.name = nil
      @user_validator.validate_name(@user).should be_false

      @user.name = "TestUser"
      @user_validator.validate_name(@user).should be_true
    end
  end

  describe "#password" do
    it "is defined" do
      @user.should respond_to("password")
    end

    it "has to be set" do
      @user.password = nil
      @user_validator.validate_password(@user).should be_false

      @user.password = "TestUser"
      @user_validator.validate_password(@user).should be_true
    end
  end

  describe "#role_id" do
    it "is defined" do
      @user.should respond_to("role_id")
    end

    it "has to be set" do
      @user.role_id = nil
      @user_validator.validate_role_id(@user).should be_false

      @user.role_id = 1
      @user_validator.validate_role_id(@user).should be_true
    end
  end

  describe "#role" do
    it "is defined" do
      @user.should respond_to("role")
    end
  end
end