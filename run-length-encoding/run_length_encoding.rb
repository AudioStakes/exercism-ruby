class RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) { |match| "#{match.length}#{match[0]}" }
  end

  def self.decode(input)
    input.gsub(/\d+./) { |match| match[-1] * match.to_i }
  end
end