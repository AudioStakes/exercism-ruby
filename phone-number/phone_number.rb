class PhoneNumber
  attr_accessor :input, :output

  def self.clean(phone_number)
    self.new(phone_number).clean
  end

  def initialize(phone_number)
    @input = phone_number
  end

  def clean
    @output = input.gsub(/[^\d]/) { |match| "" }
    remove_country_code
    valid? ? output : nil
  end

  def valid?
    output != input\
    && output[0].to_i.between?(2, 9)\
    && output[3].to_i.between?(2, 9)
  end

  def remove_country_code
    if output[0] == "1" && output.size == 11
      @output = output[1..-1]
    end
  end
end