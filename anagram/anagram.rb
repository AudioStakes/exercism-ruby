class Anagram
  def match(candidates)
    candidates.select { |candidate| anagram?(candidate) && !identical?(candidate) }
  end

  private
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def anagram?(candidate)
    sorted_chars_of(candidate) == sorted_chars_of(word)
  end

  def identical?(candidate)
    candidate.downcase == word.downcase
  end

  def sorted_chars_of(string)
    string.downcase.chars.sort
  end
end