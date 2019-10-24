class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    @phrase.scan(/\b[\w']+\b/).group_by(&:itself).transform_values(&:count)
  end
end