class ETL
  def self.transform(old)
    old.inject({}) do |new_format, (score, letters)|
      letters.inject(new_format) do |new_format, value|
        new_format[value.downcase] = score; new_format
      end
    end
  end
end