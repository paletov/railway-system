require 'spec_helper'
require 'cost'

describe Cost do
  before :each do
    @cost = Cost.new(1, 1)
  end

  describe "#time" do
    it "is defined" do
      @cost.should respond_to("time")
    end
  end

  describe "#price" do
    it "is defined" do
      @cost.should respond_to("price")
    end
  end

  describe "#+" do
    it "is defined" do
      @cost.should respond_to("+")
    end

    it "adds properly" do
      actual =  (Cost.new(0, 1) + Cost.new(1, 0))
      expected = Cost.new(1, 1)

      actual.time.should == expected.time
      actual.price.should == expected.price
    end
  end
end