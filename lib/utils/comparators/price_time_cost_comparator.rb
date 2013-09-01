require 'price_cost_comparator'

class PriceTimeCostComparator
  def compare(first_comparand, second_comparand)
    price_comparison = PriceCostComparator.new.compare(first_comparand, second_comparand)
    if price_comparison == 0
      first_comparand.time <=> second_comparand.time
    else
      price_comparison
    end
  end
end