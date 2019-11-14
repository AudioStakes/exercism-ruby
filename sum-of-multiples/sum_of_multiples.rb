class SumOfMultiples
  attr_reader :numbers
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(max)
    (1..max-1).inject(0) do |sum, multiple|
      if numbers.any? { |n| multiple % n == 0 }
        sum + multiple
      else
        sum
      end
    end
  end
end