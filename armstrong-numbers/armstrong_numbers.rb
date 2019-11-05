class ArmstrongNumbers
  def self.include?(number)
    number.digits.sum { |d| d ** number.digits.size } == number
  end
end