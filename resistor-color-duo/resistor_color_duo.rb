class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white]
  def self.value(colors_array)
    colors_array.map { |color| COLORS.index(color) }.join[0..1].to_i
  end
end