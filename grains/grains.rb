class Grains
  def self.square(number)
    raise ArgumentError unless number.between?(1, 64)
    2 ** (number - 1)
  end

  def self.total
    square(64) * 2 - 1
  end
end