class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers = (2..@limit).to_a
    numbers.each do |i|
      numbers.delete_if {|j| j % i == 0 && j > i}
    end
    numbers
  end
end