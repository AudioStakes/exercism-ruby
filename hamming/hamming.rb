class Hamming
  def self.compute(one_nucleotide, another_nucleotide)
    raise ArgumentError if one_nucleotide.size != another_nucleotide.size
    hamming_distance = 0
    one_nucleotide.chars.each_with_index do |base, i|
      hamming_distance += 1 if one_nucleotide.chars[i] != another_nucleotide.chars[i]
    end
    hamming_distance
  end
end