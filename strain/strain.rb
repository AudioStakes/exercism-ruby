class Array
  def keep
    inject([]) { |result, n| result << n if yield n; result }
  end

  def discard
    inject([]) { |result, n| result << n unless yield n; result }
  end
end