class Hamming
  def self.compute(strand1, strand2)
    raise StrandLengthError if strand1.size != strand2.size
    strand1.each_char.zip(strand2.each_char).count do |nucleotide1, nucleotide2|
      nucleotide1 != nucleotide2
    end
  end
end

class StrandLengthError < ArgumentError
  def initialize(msg = "Strand lengths must be the same length")
    super
  end
end