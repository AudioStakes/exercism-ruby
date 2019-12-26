class RailFenceCipher
  def self.encode(message, stages)
    skip_num = (stages - 1) * stages / 2
    array = []
    (1..stages).each do |stage|
      message.chars.each_with_index do |char, i|
        array << char if (i - stage - 1) % (skip_num + 1) == 0
      end
    end
  end
end