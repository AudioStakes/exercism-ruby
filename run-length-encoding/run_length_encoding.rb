class RunLengthEncoding
  attr_reader :input_chars

  def self.encode(input)
    new(input).encode
  end

  def self.decode(input)
    new(input).decode
  end

  def initialize(input)
    @input_chars = input.chars
  end

  def encode
    encoded = ""
    count = 1
    input_chars.each_with_index do |char, i|
      if input_chars[i] == input_chars[i+1]
        count += 1
      else
        count_char = count > 1 ? count.to_s + input_chars[i] : input_chars[i]
        encoded << count_char
        count = 1
      end
    end
    encoded
  end

  def decode
    decoded = ""
    input_plus1 = []
    input_chars.each_with_index do |char, i|
      if i == 0 && /[^0-9]/ === input_chars[i]
        input_plus1 << "1" + input_chars[i]
      elsif i > 0 && /[^0-9]/ === input_chars[i] && /[^0-9]/ === input_chars[i-1]
        input_plus1 << "1" + input_chars[i]
      else
        input_plus1 << input_chars[i]
      end
    end
    input_plus1.join.scan(/[0-9]+/).zip(input_plus1.join.scan(/[^0-9]+/)).each do |count, char|
      count.to_i.times do
        decoded << char
      end
    end
    decoded
  end
end