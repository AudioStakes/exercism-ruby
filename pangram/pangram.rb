class Pangram
  def self.pangram?(sentence)
    every_letter = ("a".."z").to_a
    sentence.downcase.chars.each { |n| every_letter.delete(n) }
    every_letter.size == 0
  end
end