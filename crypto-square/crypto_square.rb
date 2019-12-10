class Crypto
  attr_reader :normalized_array_of_sentence
  def initialize(sentence)
    @normalized_array_of_sentence = sentence.downcase.scan(/\w/)
  end

  def to_rectangle(normalized_array_of_sentence)
    @length = normalized_array_of_sentence.length
    return normalized_array_of_sentence if @length <= 1
    c, r = 0, 0
    while !((c - 1) * r < @length && @length <= c * r)
      r < c ? r += 1 : c += 1
    end
    while @length != c * r
      normalized_array_of_sentence << ' '
      @length += 1
    end
    rectangle = []
    normalized_array_of_sentence.each_slice(c) do |arr|
      rectangle << arr
    end
    rectangle.transpose.map { |arr| arr.join }
  end

  def ciphertext
    to_rectangle(normalized_array_of_sentence).join(' ')
  end
end