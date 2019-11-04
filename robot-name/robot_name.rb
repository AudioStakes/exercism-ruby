class Robot
  attr_reader :name
  @@name= []
  def self.forget
    @@name= []
  end

  def name
    @name ||= name_uniq
  end

  def name_uniq
    name_pre = generate_name
    while @@name.find(name_pre) do
      name_pre = generate_name
    end
    @@name << name_pre
    @name = name_pre
  end

  def generate_name
    (("A".."Z").to_a.sample(2) + (0..9).to_a.sample(3)).join
  end

  def reset
    @name = nil
  end
end