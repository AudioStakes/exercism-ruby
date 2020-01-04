class Say
  NUMBERS_IN_ENGISH_1000_UNDER = {
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
    @number = number
  end

  def in_english(number = "")
    raise ArgumentError unless @number.between?(0, 999_999_999_999)
    return "zero" if @number == 0
    split_to_every_1000.map do |key, number|
      if key != "one"
        in_english_1000_under(number) + key if number > 0
      else
        in_english_1000_under(number) if number > 0
      end
    end.select { |n| n != "" }.join.rstrip
  end

  def split_to_every_1000
    billion, amari = @number.divmod(1000_000_000)
    million, amari = amari.divmod(1000_000)
    thousand, one = amari.divmod(1000)
    {
      " billion " => billion,
      " million " => million,
      " thousand " => thousand,
      "one" => one
    }
  end

  def in_english_1000_under(number)
    str = ""
    NUMBERS_IN_ENGISH_1000_UNDER.each do |num, name|
      if number == 0
        return ""
      elsif number.to_s.length == 1 && number/num > 0
        return str + "#{name}"
      elsif number < 100 && number/num > 0
        return str + "#{name}" if number%num == 0
        return str + "#{name}-" + in_english_1000_under(number%num)
      elsif number/num > 0
        return str + in_english_1000_under(number/num) + " #{name} " + in_english_1000_under(number%num)
      end
    end
  end
end