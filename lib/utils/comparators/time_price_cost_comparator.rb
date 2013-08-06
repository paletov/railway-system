require 'time_cost_comparator'

class TimePriceCostComparator
  def compare(first_comparand, second_comparand)
    time_comparison = TimeCostComparator.new.compare(first_comparand, second_comparand)
    if time_comparison == 0 then first_comparand.price <=> second_comparand.price
    else time_comparison
    end
  end
end