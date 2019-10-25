class Raindrops
  RAINDROPS = {3 => "Pling", 5 => "Plang", 7 => "Plong" }
  def self.convert(number)
    sounds = ""
    RAINDROPS.each do |factor, sound|
      sounds << sound if number % factor == 0
    end
    sounds.empty? ? number.to_s : sounds
  end
end