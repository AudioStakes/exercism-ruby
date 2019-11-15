class SumOfMultiples
  attr_reader :numbers
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(limit)
    (1..limit-1).select{ |n| multiple? n }.inject(0, :+)
  end

  def multiple?(n)
    numbers.any? { |x| n % x == 0 }
  end
end