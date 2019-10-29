class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.size != strand2.size
    strand1.chars.zip(strand2.chars).count do |nucleotide1, nucleotide2|
      nucleotide1 != nucleotide2
    end
  end
end