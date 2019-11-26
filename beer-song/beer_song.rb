class BeerSong
  def self.recite(beers, takes)
    lyrics = ""
    (1..takes).reverse_each do |n|
      existing_beers = beers-(takes-n)
      remaining_beers = existing_beers-1
      existing = ""
      takedown = ""
      remaining = ""
      if existing_beers > 2 then
        existing = "#{existing_beers} bottles"
        takedown = "Take one down and pass it around"
        remaining = "#{remaining_beers} bottles"
      elsif existing_beers == 2 then
        existing = "#{existing_beers} bottles"
        takedown = "Take one down and pass it around"
        remaining = "1 bottle"
      elsif existing_beers == 1 then
        existing = "1 bottle"
        takedown = "Take it down and pass it around"
        remaining = "no more bottles"
      elsif existing_beers == 0 then
        existing = "No more bottles"
        takedown = "Go to the store and buy some more"
        remaining = "99 bottles"
      end
      lyrics << "\n" if n != takes
      lyrics << "#{existing} of beer on the wall, #{existing.downcase} of beer.\n"
      lyrics << "#{takedown}, #{remaining} of beer on the wall.\n"
    end
    lyrics
  end
end