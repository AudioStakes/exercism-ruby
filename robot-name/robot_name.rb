class Robot
  attr_reader :name
  @@all_names= []
  def self.forget
    @@all_names = ("AA".."ZZ").to_a.product(("000".."999").to_a).shuffle!
  end

  def name
    @name ||= @@all_names.pop.join
  end

  def reset
    @name = nil
  end
end