class Clock
  attr_reader :hour, :minute
  def initialize(hour: 0, minute: 0)
    @minute = minute
    @hour = hour
  end

  def to_s
    @hour = (@hour + @minute.div(60)) % 24
    @minute = @minute % 60
    format("%02d:%02d", @hour, @minute)
  end

  def +(other_clock)
    if other_clock.is_a?(Clock)
      @minute = @minute + other_clock.minute
      @hour = @hour + other_clock.hour
    end
    self
  end

  def -(other_clock)
    if other_clock.is_a?(Clock)
      @minute = @minute - other_clock.minute
      @hour = @hour - other_clock.hour
    end
    self
  end

  def ==(other_clock)
    if other_clock.is_a?(Clock)
      self.to_s == other_clock.to_s
    else
      false
    end
  end
end