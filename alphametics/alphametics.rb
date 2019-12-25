class Alphametics
  def self.solve(puzzle)
    uniq_chars = puzzle.scan(/\w/).uniq.sort
    (0..9).to_a.permutation(uniq_chars.size).each do |digits|
      replace = puzzle.tr(uniq_chars.join, digits.join)
      next if replace.scan(/\d+/).any? { |n| n[0] == '0' }
      return uniq_chars.zip(digits).to_h if eval(replace)
    end
    return Hash.new
  end
end