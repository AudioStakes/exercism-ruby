class ResistorColorDuo
  COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
  def self.value((first_color, second_color))
    (COLORS.index(first_color).to_s + COLORS.index(second_color).to_s).to_i
  end
end