class PriceCostComparator
  def compare(first_comparand, second_comparand)
    first_comparand.price <=> second_comparand.price
  end
end