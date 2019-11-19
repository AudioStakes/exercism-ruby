class PhoneNumber
  VALID_PHONE_NUMBER = /^([2-9]\d\d){2}\d{4}$/

  def self.clean(phone_number)
    cleaned = phone_number.gsub(/\D/, "").sub(/^1(\d{10})$/, "\\1")
    cleaned[VALID_PHONE_NUMBER]
  end
end