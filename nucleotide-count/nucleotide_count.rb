class Nucleotide
  NUCLEOTIDE_TYPES = "ATCG"

  def initialize(dna)
    @dna = dna
  end

  def self.from_dna(dna)
    raise ArgumentError if /[^#{NUCLEOTIDE_TYPES}]/ =~ dna
    new(dna)
  end

  def count(n)
    @dna.count(n)
  end

  def histogram
    NUCLEOTIDE_TYPES.chars.map { |n| [n, count(n)] }.to_h
  end
end