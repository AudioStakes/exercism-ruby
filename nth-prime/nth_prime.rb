class Prime
  def self.nth(number)
    raise ArgumentError unless number > 0
    n = 1
    primes = []
    while primes.size != number do
      n += 1
      primes << n if primes.all? { |prime| n % prime != 0}
    end
    n
  end
end