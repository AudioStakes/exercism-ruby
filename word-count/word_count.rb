class Phrase
  def initialize(word)
    @word = word
  end

  def word_count
    @word.scan(/\w+'?\w|\d/).map(&:downcase).group_by(&:itself).map{ |key, value| [key, value.count] }.to_h
  end
end