class ArmstrongNumbers
  def self.include?(number)
    @digits = number.to_s.chars
    power = 0
    @digits.each do |d|
      power += d.to_i ** @digits.size
    end
    number == power
  end
end