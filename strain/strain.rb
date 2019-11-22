class Array
  def keep
    select { |n| yield n }
  end

  def discard
    reject { |n| yield n }
  end
end