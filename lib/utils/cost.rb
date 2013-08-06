class Cost
  attr_accessor :time, :price

  def initialize(time, price)
    @time = time
    @price = price
  end

  def +(cost)
    Cost.new(@time + cost.time, @price + cost.price)
  end

  def to_s
    "price = #{@price}, time = #{@time}"
  end

  class << self
    def empty
      Cost.new(nil, nil)
    end

    def from_edge(edge)
      Cost.new(edge.end_datetime - edge.start_datetime, edge.price)
    end

    def max_value
      Cost.new(1000000000, 1000000000)
    end
  end
end