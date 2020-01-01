class Nucleotide
  def initialize(dna)
    @dna = dna
  end

  def self.from_dna(dna)
    raise ArgumentError unless dna.chars.all? { |n| n == 'A' || n == 'T' || n == 'C' || n == 'G' }
    Nucleotide.new(dna)
  end

  def count(nucleotide)
    @dna.chars.count { |n| n == nucleotide}
  end

  def histogram
    { 'A' => count('A'), 'T' => count('T'), 'C' => count('C'), 'G' => count('G') }
  end
end