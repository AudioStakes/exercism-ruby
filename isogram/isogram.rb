class Isogram
  def self.isogram?(input)
    @chars = input.downcase.scan(/\w/)
    @chars == @chars.uniq
  end
end