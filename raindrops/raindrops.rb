class Raindrops
  def self.convert(digit)
    output = ""
    if digit % 3 == 0
      output << "Pling"
    end
    if digit % 5 == 0
      output << "Plang"
    end
    if digit % 7 == 0
      output << "Plong"
    end
    if digit % 3 != 0 && digit % 5 != 0 && digit % 7 != 0
      output = digit.to_s
    end
    output
  end
end