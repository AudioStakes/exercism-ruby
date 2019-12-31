class RailFenceCipher
  def self.decode(ciphertext, stages)
    all_of_zigzag(stages, ciphertext.length)
    .sort
    .zip(ciphertext.chars)
    .sort_by { |a| a[0][1] }
    .map { |a| a[1] }
    .join
  end

  def self.encode(plaintext, stages)
    all_of_zigzag(stages, plaintext.length)
      .zip(plaintext.chars)
      .sort
      .map { |a| a[1] }
      .join
  end

  def self.all_of_zigzag(stages, size)
    one_of_zigzag = (0..stages - 1).to_a + (1..stages - 2).to_a.reverse
    one_of_zigzag.cycle.first(size).zip(0..size)
  end
end