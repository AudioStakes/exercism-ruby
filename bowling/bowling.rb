class Game

  class BowlingError < StandardError
  end

  def initialize
    @current_frame = []
    @flames = []
    @bonus = 0
  end

  def roll(pins)
    check_pins(pins)
    @current_frame << pins
    check_frame

    if @flames.size >= 1
      if strike?(@flames.last) || (spare?(@flames.last) && first_throw?)
        @bonus += pins
      end
    end
    if @flames.size >= 2
      if strike?(@flames.last) && strike?(@flames[-2]) && first_throw? && !final_frame?
        @bonus += pins
      end
    end

    return unless flame_finished?

    @flames.push(@current_frame)
    @current_frame = []
  end

  def score
    check_score
    @flames.flatten.sum + @bonus
  end

  def first_throw?
    @current_frame.size == 1
  end

  def second_throw?
    @current_frame.size == 2
  end

  def third_throw?
    @current_frame.size == 3 && final_frame?
  end

  def final_frame?
    @flames.size == 9
  end

  def strike?(flame)
    flame.size == 1 && flame.first == 10
  end

  def spare?(flame)
    flame.size == 2 && flame.sum == 10
  end

  def flame_finished?
    (strike?(@current_frame) && !final_frame?)\
    || (second_throw? && !final_frame?)\
    || (second_throw? && final_frame? && @current_frame.sum < 10)\
    || third_throw?
  end

  def check_pins(pins)
    raise BowlingError unless pins.between?(0, 10)
    raise BowlingError unless @flames.size.between?(0, 9)
  end

  def check_frame
    if !final_frame? && second_throw?
      raise BowlingError unless @current_frame.sum.between?(0, 10)
    elsif final_frame? && second_throw? && @current_frame.first < 10
      raise BowlingError unless @current_frame.sum.between?(0, 10)
    elsif final_frame? && third_throw? && @current_frame.first == 10 && @current_frame[1] < 10
      raise BowlingError unless @current_frame.sum.between?(10, 20)
    elsif final_frame? && third_throw? && @current_frame.first == 10 && @current_frame[1] == 10
      raise BowlingError unless @current_frame.sum.between?(20, 30)
    elsif final_frame?
      raise BowlingError unless @current_frame.sum.between?(0, 30)
    end
  end

  def check_score
    raise BowlingError unless @flames.flatten.size > 0
    raise BowlingError unless @flames.size == 10
  end
end