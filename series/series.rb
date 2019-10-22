class Series
  def initialize(num_str)
    @num_str = num_str
  end

  def slices(n)
    raise ArgumentError if n > @num_str.size
    digits = []
    (@num_str.size - n + 1).times do |i|
      digits << @num_str[i..(i + n - 1)]
    end
    digits
  end
end