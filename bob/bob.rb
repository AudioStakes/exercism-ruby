class Bob
  def self.hey(remark)
    remark = remark.to_s.strip
    if yelling?(remark) && question?(remark)
      "Calm down, I know what I'm doing!"
    elsif yelling?(remark)
      "Whoa, chill out!"
    elsif question?(remark)
      "Sure."
    elsif silent?(remark)
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  private
  def self.silent?(remark)
    remark.empty?
  end

  def self.yelling?(remark)
    /[a-zA-Z]/ === remark && remark.upcase == remark
  end

  def self.question?(remark)
    remark.end_with?('?')
  end
end