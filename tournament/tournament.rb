class Tournament
  def self.tally(input)
    User.users = []
    input.chomp.each_line do |line|
      match_result = line.split(";")
      user0 = User.find_or_create(match_result[0])
      user1 = User.find_or_create(match_result[1])
      case match_result[2].chomp
      when "win" then
        user0.win
        user1.loss
      when "loss" then
        user0.loss
        user1.win
      when "draw" then
        user0.draw
        user1.draw
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

  private
  def initialize(name)
    @name = name
    @won, @drawn, @lost = 0, 0, 0
    @@users << self
  end

  public
  def outcome
    outcome = "\n"
    outcome << [\
      name.ljust(30)\
      ,match_played.to_s.rjust(2)\
      ,won.to_s.rjust(2)\
      ,drawn.to_s.rjust(2)\
      ,lost.to_s.rjust(2)\
      ,point.to_s.rjust(2)\
    ].join(" | ")
  end

  def win
    self.won += 1
  end

  def loss
    self.lost += 1
  end

  def draw
    self.drawn += 1
  end

  def point
    won * 3 + drawn
  end

  def match_played
    won + drawn + lost
  end

  def self.users=(users)
    @@users = users
  end

  def self.users
    @@users
  end

  def self.users_sort
    @@users.sort { |a, b| (b.point <=> a.point).nonzero? || (a.name <=> b.name) }
  end

  def self.find_or_create(name)
    @@users.find {|user| user.name == name} || User.new(name)
  end

  def self.results
    self.users_sort.map(&:outcome).join
  end
end