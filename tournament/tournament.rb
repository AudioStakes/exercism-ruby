class Tournament
  def self.tally(input)
    User.users = []
    input.chomp.each_line do |line|
      match_result = line.split(";")
      user0 = User.find_or_create(match_result[0])
      user1 = User.find_or_create(match_result[1])
      case match_result[2].chomp
      when "win" then
        user0.won += 1
        user1.lost += 1
      when "loss" then
        user0.lost += 1
        user1.won += 1
      when "draw" then
        user0.drawn += 1
        user1.drawn += 1
      end
    end
    <<~TALLY
    Team                           | MP |  W |  D |  L |  P#{User.results}
    TALLY
  end
end

class User
  @@users = []
  attr_reader :name
  attr_accessor :won, :drawn, :lost
  def initialize(name)
    @name = name
    @won, @drawn, @lost = 0, 0, 0
    @@users << self
  end

  def point
    @won * 3 + @drawn
  end

  def match_played
    @won + @drawn + @lost
  end

  def outcome
    outcome = "\n"
    outcome <<  @name.ljust(30) + " | "
    outcome <<  match_played.to_s.rjust(2) + " | "
    outcome <<  @won.to_s.rjust(2) + " | "
    outcome <<  @drawn.to_s.rjust(2) + " | "
    outcome <<  @lost.to_s.rjust(2) + " | "
    outcome <<  point.to_s.rjust(2)
    outcome
  end

  def self.users=(users)
    @@users = users
  end

  def self.users
    @@users
  end

  def self.users_sort
    @@users.sort do |a, b|
      (b.point <=> a.point).nonzero? ||
        (a.name <=> b.name)
    end
  end

  def self.find_or_create(name)
    user = @@users.find {|user| user.name == name}
    if user.nil?
      user = User.new(name)
    end
    user
  end

  def self.results
    results = ""
    self.users_sort.each do |user|
      results << user.outcome
    end
    results
  end
end