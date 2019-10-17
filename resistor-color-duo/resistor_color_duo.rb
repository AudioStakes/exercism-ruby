class ResistorColorDuo
    RESISTANCE_VALUE_FOR_EACH_COLOR = {
    black: "0",
    brown: "1",
    red: "2",
    orange: "3",
    yellow: "4",
    green: "5",
    blue: "6",
    violet: "7",
    grey: "8",
    white: "9"
  }

  def self.value((a, b))
    (RESISTANCE_VALUE_FOR_EACH_COLOR[a.to_sym] + RESISTANCE_VALUE_FOR_EACH_COLOR[b.to_sym]).to_i
  end
end