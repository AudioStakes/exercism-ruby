class Game
  attr_reader :frames
  def initialize
    @frames = Array.new(9){ Frame.new }
    @frames << TenthFrame.new
    @current_frame = 1
  end

  def roll(pins)
    raise BowlingError if frames.all? { |frame| frame.complete? }
    frames[@current_frame - 1].roll(pins)
    @current_frame += 1 if frames[@current_frame - 1].complete?
  end

  def score
    raise BowlingError unless frames.all? { |frame| frame.complete? }
    @socre = 0
    frames.each_with_index do |frame, n|
      if frame.strike? && n < 9
        if frames[n + 1].strike? && n < 8
          @bonus = 10 + frames[n + 2].roll_one
        else
          @bonus = frames[n + 1].roll_one+ frames[n + 1].roll_two
        end
      elsif frame.spare? && n < 9
        @bonus = frames[n + 1].roll_one
      else
        @bonus = 0
      end
      @socre += frame.score(@bonus)
    end
    @socre
  end

  class Frame
    attr_reader :roll_one, :roll_two
    def initialize
      @roll_one = nil
      @roll_two = nil
    end

    def roll(pins)
      raise BowlingError unless pins.between?(0, 10)
      if roll_one.nil?
        @roll_one = pins
      else
        raise BowlingError unless (roll_one + pins).between?(0, 10)
        @roll_two = pins
      end
    end

    def score(bonus)
      if strike?
        10 + bonus
      else
        roll_one + roll_two + bonus
      end
    end

    def strike?
      roll_one == 10
    end

    def spare?
      roll_one + roll_two == 10
    end

    def complete?
      strike? || roll_one && roll_two
    end
  end

  class TenthFrame < Frame
    attr_reader :roll_one, :roll_two, :roll_three
    def initialize
      super
      @roll_three = nil
    end

    def roll(pins)
      raise BowlingError unless pins.between?(0, 10)
      if roll_one.nil?
        @roll_one = pins
      elsif roll_two.nil?
        if strike?
          raise BowlingError unless (roll_one + pins).between?(10, 20)
        else
          raise BowlingError unless (roll_one + pins).between?(0, 10)
        end
        @roll_two = pins
      else
        if double_strike?
          raise BowlingError unless (roll_two + pins).between?(10, 20)
        elsif strike?
          raise BowlingError unless (roll_two + pins).between?(0, 10)
        end
        @roll_three = pins
      end
    end

    def score(bonus)
      if roll_three
        roll_one + roll_two + roll_three
      else
        roll_one + roll_two
      end
    end

    def double_strike?
      roll_one = 10 && roll_two == 10
    end

    def complete?
      if !roll_two
        return false
      else
        roll_one + roll_two < 10 || roll_one && roll_two && roll_three
      end
    end
  end

  class BowlingError < StandardError
  end
end