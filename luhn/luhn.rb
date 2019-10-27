class Luhn
  def self.valid?(input)
    input
      .gsub(/\s/, '')
      .tap { |s| return false unless /\A\d\d+\z/ === s }
      .chars
      .reverse
      .map(&:to_i)
      .map.with_index { |d, i| i.odd? ? d * 2 : d }
      .map { |d| d > 9 ? d - 9 : d }
      .sum % 10 == 0
  end
end