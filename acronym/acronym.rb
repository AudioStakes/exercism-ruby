class Acronym
    def self.abbreviate(words)
        acronym = ""
        words.scan(/\w+/).each do |word|
            acronym << word[0].upcase
        end
        acronym
    end
end