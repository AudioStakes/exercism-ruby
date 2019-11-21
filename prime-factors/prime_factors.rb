class PrimeFactors
  def self.of(number)
    factors = []
    divisor = 2
    while divisor <= number do
      if number % divisor == 0
        factors << divisor
        number /= divisor
      else
        divisor += 1
      end
    end
    factors
  end
end