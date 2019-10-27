class Clock
  attr_reader :hours, :minutes
  def initialize(hour: 0, minute: 0)
    exceed_hours, @minutes = minute.divmod(60)
    @hours = (hour + exceed_hours) % 24
  end

  def to_s
    "%02d:%02d" % [hours, minutes]
  end

  def +(other)
    Clock.new(
      hour: @hours + other.hours,
      minute: @minutes + other.minutes
    )
  end

  def -(other)
    Clock.new(
      hour: @hours - other.hours,
      minute: @minutes - other.minutes
    )
  end

  def ==(other)
    self.to_s == other.to_s
  end
end