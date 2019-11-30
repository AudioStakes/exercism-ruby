class Game

  class BowlingError < StandardError
  end

  def initialize
    @throws = []
    @flames = []
    @bonus = 0
  end

  def roll(pins)
    raise BowlingError unless pins_valid?(pins)
    @pins = pins
    @throws.push(pins)
    if is_first_throw_in_frame?
      if @flames.size > 1 && @flames.last.first == 10 && @flames[-2].first == 10
        @bonus += pins * 2
      elsif @flames.last.sum == 10
        @bonus += pins
      end
    elsif is_second_throw_in_frame?
      @bonus += pins if @flames.last.first == 10
    end
    if (pins == 10 && @flames.size.between?(0, 8))\
      || (@throws.size == 2 && @flames.size.between?(0, 8))\
      || (@throws.size == 2 && @flames.size == 9 && @throws.sum != 10 && @throws.first != 10)\
      || @throws.size == 3
      @flames.push(@throws)
      @throws = []
    end
  end

  def score
    raise BowlingError unless score_valid?
    @flames.flatten.sum + @bonus
  end

  def is_first_throw_in_frame?
    @throws.size == 1 && @flames.size.between?(1, 9)
  end

  def is_second_throw_in_frame?
    @throws.size == 2 && @flames.size.between?(1, 9)
  end

  def pins_valid?(pins)
    return false unless pins.between?(0, 10)
    return false if @flames.size == 10
    if @throws.size == 1 && @flames.size.between?(0, 8)
      return false unless (pins + @throws[-1]).between?(0, 10)
    elsif @flames.size == 9 && @throws.size == 1 && @throws[-1] != 10
      return false unless (pins + @throws[-1]).between?(0, 10)
    elsif @flames.size == 9 && @throws.size == 2 && @throws[-1] != 10 && @throws[-2] == 10
      return false unless (pins + @throws[-1]).between?(0, 10)
    elsif @flames.size == 9 && @throws.size == 2 && @throws[-2] == 10
      return false unless (pins + @throws[-1]).between?(10, 20)
    elsif @flames.size == 9
      return false unless (pins + @throws.sum).between?(0, 30)
    end
    return true
  end

  def score_valid?
    return false unless @flames.flatten.size > 0
    return false unless @flames.size == 10
    return true
  end
end