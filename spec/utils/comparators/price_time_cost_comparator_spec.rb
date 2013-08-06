require 'spec_helper'
require 'cost'
require 'price_time_cost_comparator'

describe PriceTimeCostComparator do
  before :each do
    @price_time_cost_comparator = PriceTimeCostComparator.new
  end

  describe "#compare" do
    it "compares two cost objects by their price and time" do
      @price_time_cost_comparator.compare(Cost.new(0, 1), Cost.new(0, 0)).should == 1
      @price_time_cost_comparator.compare(Cost.new(0, 0), Cost.new(1, 0)).should == -1
      @price_time_cost_comparator.compare(Cost.new(1, 0), Cost.new(0, 1)).should == -1
    end
  end
end