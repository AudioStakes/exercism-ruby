class StrandLengthError < ArgumentError
  def initialize(message = "Strand lengths must be the same length")
    super
  end
end