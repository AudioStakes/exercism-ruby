class Matrix
  def initialize(matrix_string)
    @matrix_string = matrix_string
  end

  def rows
    @matrix_string.each_line.map do |line|
      line.chomp.split.map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end
end