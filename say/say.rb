class Say
  NUMBERS_IN_ENGISH_UNDER_1000 = {
    100 => "hundred",
    90 => "ninety",
    80 => "eighty",
    70 => "seventy",
    60 => "sixty",
    50 => "fifty",
    40 => "forty",
    30 => "thirty",
    20 => "twenty",
    19 => "nineteen",
    18 => "eighteen",
    17 => "seventeen",
    16 => "sixteen",
    15 => "fifteen",
    14 => "fourteen",
    13 => "thirteen",
    12 => "twelve",
    11 => "eleven",
    10 => "ten",
    9 => "nine",
    8 => "eight",
    7 => "seven",
    6 => "six",
    5 => "five",
    4 => "four",
    3 => "three",
    2 => "two",
    1 => "one"
  }
  def initialize(number)
    raise ArgumentError unless number.between?(0, 999_999_999_999)
    @number = number
  end

  def in_english
    return "zero" if @number == 0
    to_every_1000_unit.map do |unit, value|
      if unit == "one"
        in_english_under_1000(value) if value > 0
      else
        in_english_under_1000(value) + " #{unit} " if value > 0
      end
    end.join.rstrip
  end

  def to_every_1000_unit
    billion, remainder = @number.divmod(1000_000_000)
    million, remainder = remainder.divmod(1000_000)
    thousand, one = remainder.divmod(1000)
    {
      "billion" => billion,
      "million" => million,
      "thousand" => thousand,
      "one" => one
    }
  end

  def in_english_under_1000(digit)
    NUMBERS_IN_ENGISH_UNDER_1000.each do |num, name|
      if digit == 0
        return ""
      elsif digit < 10 && digit / num > 0
        return "#{name}"
      elsif digit < 100 && digit / num > 0
        return "#{name}" if digit % num == 0
        return "#{name}-" + in_english_under_1000(digit % num)
      elsif digit / num > 0
        return in_english_under_1000(digit / num) + " #{name} " + in_english_under_1000(digit % num)
      end
    end
  end
end