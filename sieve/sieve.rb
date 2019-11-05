require 'prime'

class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    Prime.each(@number).to_a
  end
end
