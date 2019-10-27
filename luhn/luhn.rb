class Luhn
  def self.valid?(card_number)
    @card_number = card_number.gsub(" ", "").scan(/[0-9]/).join
    if @card_number.size > 1 && @card_number == card_number.gsub(" ", "")
      @doubled_num = @card_number.chars.map.with_index do |digit, i|
        @digit = digit.to_i
        @doubled_digit = @digit * 2
        if i.even?
          @doubled_digit >= 10 ? @doubled_digit - 9 : @doubled_digit
        else
          @digit
        end
      end
      @doubled_num.sum % 10 == 0
    else
      false
    end
  end
end