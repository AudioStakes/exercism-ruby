class Matrix
  attr_reader :rows, :columns
  def initialize(numbers)
    @rows = []
    numbers.scan(/[\d| ]+/).map do |i|
      @rows << i.scan(/\d+/).map(&:to_i)
    end

    @columns = Array.new(@rows[0].size).map{Array.new(@rows.size,0)}
    @rows.each_with_index do |row, i|
      row.size.times do |j|
        @columns[j][i] = row[j]
      end
    end
  end
end