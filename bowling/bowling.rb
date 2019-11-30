class Game

  class BowlingError < StandardError
  end

  def initialize
    @throws = []
    @flames = []
    @bonus = 0
  end

  def roll(pins)
    @pins = pins if pins_valid?(pins)
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
    @flames.flatten.sum + @bonus if score_valid?(score)
  end

  def is_first_throw_in_frame?
    @throws.size == 1 && @flames.size.between?(1, 9)
  end

  def is_second_throw_in_frame?
    @throws.size == 2 && @flames.size.between?(1, 9)
  end

  def pins_valid?(pins)
    raise BowlingError unless pins.between?(0, 10)
    if @throws.size == 1 && @flames.size.between?(0, 8)
      raise BowlingError unless (pins + @throws[-1]).between?(0, 10)
    elsif @flames.size == 9 && @throws.size == 1 && @throws[-1] != 10
      raise BowlingError unless (pins + @throws[-1]).between?(0, 10)
    elsif @flames.size == 9 && @throws.size == 2 && @throws[-1] != 10 && @throws[-2] == 10
      raise BowlingError unless (pins + @throws[-1]).between?(0, 10)
    elsif @flames.size == 9 && @throws.size == 2 && @throws[-2] == 10
      raise BowlingError unless (pins + @throws[-1]).between?(10, 20)
    elsif @flames.size == 9
      raise BowlingError unless (pins + @throws.sum).between?(0, 30)
    end
  end

  def score_valid?
  end
end