class RailFenceCipher
  def self.encode(message, stages)
    multiple = ((stages - 1) * stages / 2 ) + 1
    array = []
    (1..stages).each do |stage|
      message.chars.each_with_index do |char, i|
        array << char if (i + stage - 1) % multiple == 0
      end
    end
    array.join
  end
end