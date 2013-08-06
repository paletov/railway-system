require 'spec_helper'
require 'cost'
require 'price_cost_comparator'

describe PriceCostComparator do
  before :each do
    @price_cost_comparator = PriceCostComparator.new
  end

  describe "#compare" do
    it "compares two cost objects by their price" do
      @price_cost_comparator.compare(Cost.new(0, 1), Cost.new(0, 0)).should == 1
      @price_cost_comparator.compare(Cost.new(0, 0), Cost.new(1, 0)).should == 0
      @price_cost_comparator.compare(Cost.new(1, 0), Cost.new(0, 1)).should == -1
    end
  end
end