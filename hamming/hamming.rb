require_relative 'strand_length_error'
class Hamming
  def self.compute(strand1, strand2)
    new(strand1, strand2).distance
  end

  private
  attr_reader :strand1, :strand2

  def initialize(strand1, strand2)
    @strand1 = strand1
    @strand2 = strand2
    raise StrandLengthError unless valid?
  end

  def valid?
    strand1.size == strand2.size
  end

  def nucleotides
    strand1.each_char.zip(strand2.each_char)
  end

  public
  def distance
    nucleotides.count {|n1, n2| n1 != n2}
  end
end