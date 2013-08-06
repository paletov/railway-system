require 'spec_helper'
require 'cost'
require 'time_price_cost_comparator'

describe TimePriceCostComparator do
  before :each do
    @time_price_cost_comparator = TimePriceCostComparator.new
  end

  describe "#compare" do
    it "compares two cost objects by their time and price" do
      @time_price_cost_comparator.compare(Cost.new(0, 1), Cost.new(0, 0)).should == 1
      @time_price_cost_comparator.compare(Cost.new(0, 0), Cost.new(1, 0)).should == -1
      @time_price_cost_comparator.compare(Cost.new(1, 0), Cost.new(0, 1)).should == 1
    end
  end
end