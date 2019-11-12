class Array
  def accumulate!(&block)
    self.each_with_index do |number, i|
      self[i] = block.call(number)
    end
  end

  def accumulate(&block)
    copy = self.dup
    copy.accumulate!(&block)
  end
end