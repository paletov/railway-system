require 'spec_helper'
require 'cost'
require 'time_cost_comparator'

describe TimeCostComparator do
  before :each do
    @time_cost_comparator = TimeCostComparator.new
  end

  describe "#compare" do
    it "compares two cost objects by their time" do
      @time_cost_comparator.compare(Cost.new(0, 1), Cost.new(0, 0)).should == 0
      @time_cost_comparator.compare(Cost.new(0, 0), Cost.new(1, 0)).should == -1
      @time_cost_comparator.compare(Cost.new(1, 0), Cost.new(0, 1)).should == 1
    end
  end
end