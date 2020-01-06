require 'date'
class Meetup
  DAYS = {0 => :sunday,
    1 => :monday,
    2 => :tuesday,
    3 => :wednesday,
    4 => :thursday,
    5 => :friday,
    6 => :saturday}

  def initialize(month, year)
    @month = month
    @year = year
    @start_of_month = Date.new(@year, @month, 1)
    @end_of_month = Date.new(@year, @month, -1)
    @dates = []
    @day = @start_of_month
    while @day <= @end_of_month
      @dates << @day
      @day += 1
    end
  end

  def day(day_of_week, descriptor)
    if descriptor == :teenth
      @dates.select { |date| DAYS[date.wday] == day_of_week && teenth?(date.day)}.first
    end
  end

  def teenth?(day)
    day.between?(13,19)
  end
end