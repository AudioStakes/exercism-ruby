require 'prime'

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    @primes = []
    n = 2
    while n <= @limit do
      if @primes.all? { |prime| n % prime != 0 }
        @primes << n
      end
      n += 1
    end
    @primes
  end
end
