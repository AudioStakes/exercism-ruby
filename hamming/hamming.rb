class Hamming
  def self.compute(strand1, strand2)
    raise StrandLengthError unless strand1.size == strand2.size
    strand1.each_char.zip(strand2.each_char).count do |n1, n2|
      n1 != n2
    end
  end
end

class StrandLengthError < ArgumentError
  def initialize(message = "Strand lengths must be the same length")
    super
  end
end