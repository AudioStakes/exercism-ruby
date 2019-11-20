class PrimeFactors
  def self.of(number)
    factors = []
    n = 2
    while n <= number do
      if number % n == 0
        factors << n
        number = number / n
      else
        n += 1
      end
    end
    factors
  end
end
