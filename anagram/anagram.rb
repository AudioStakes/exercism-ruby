class Anagram
  def initialize(word)
    @word = word.downcase
    @chars = word.downcase.chars.sort
  end

  def match(candidates)
    candidates.select do |candidate|
      candidate.downcase.chars.sort == @chars\
      && candidate.downcase != @word
    end
  end
end