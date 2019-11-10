class RunLengthEncoding
  attr_reader :input_array

  def self.encode(input)
    new(input).encode
  end

  def self.decode(input)
    new(input).decode
  end

  def initialize(input)
    @input_array = input.scan(/\D|\d+/)
  end

  def encode
    encoded = ""
    count = 1
    input_array.each_with_index do |char, i|
      if input_array[i] == input_array[i+1]
        count += 1
      else
        count_char = count > 1 ? count.to_s + input_array[i] : input_array[i]
        encoded << count_char
        count = 1
      end
    end
    encoded
  end

  def decode
    decoded = ""
    input_array.each_with_index do |char, i|
      prev_char = input_array[i-1]
      if /\D/ === char
        if  /\d+/ === prev_char
          decoded << char * prev_char.to_i
        else
          decoded << char
        end
      end
    end
    decoded
  end
end