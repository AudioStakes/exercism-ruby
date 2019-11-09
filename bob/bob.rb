class Bob
  def self.hey(remark)
    new(remark).hey
  end

  def hey
    if silent?
      "Fine. Be that way!"
    elsif yell? && question?
      "Calm down, I know what I'm doing!"
    elsif yell? && !question?
      "Whoa, chill out!"
    elsif !yell? && question?
      "Sure."
    else
      "Whatever."
    end
  end

  private
  def initialize(remark)
    @remark = remark.scan(/[^ |\t|\n|\r|\f]/)
    @end_of_remark = @remark.pop
  end

  def silent?
    @remark.size == 0
  end

  def yell?
    @remark.grep(/[a-zA-Z]/).size > 0 &&
    @remark.grep(/[a-zA-Z]/).all? {|char| /[A-Z]/ === char}
  end

  def question?
    @end_of_remark == "?"
  end
end