class TwelveDays
  LYLIC_PART = {
    first: "a Partridge in a Pear Tree.",
    second: "two Turtle Doves, and ",
    third: "three French Hens, ",
    fourth: "four Calling Birds, ",
    fifth: "five Gold Rings, ",
    sixth: "six Geese-a-Laying, ",
    seventh: "seven Swans-a-Swimming, ",
    eighth: "eight Maids-a-Milking, ",
    ninth: "nine Ladies Dancing, ",
    tenth: "ten Lords-a-Leaping, ",
    eleventh: "eleven Pipers Piping, ",
    twelfth: "twelve Drummers Drumming, "
  }
  def self.song
    lyric = ""
    last_part = ""
    LYLIC_PART.each do |num, last|
      last_part = last + last_part
      lyric << "On the #{num} day of Christmas my true love gave to me: #{last_part}\n\n"
    end
    lyric.encode!("Windows-31J").chomp
  end
end