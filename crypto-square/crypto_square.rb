class Crypto

  def initialize(text)
    @text = text
  end

  def ciphertext
    return '' if size == 0
    ps = plaintext_segments
    ps.last << ' ' while ps.last.length < size
    ps.transpose.map(&:join).join(' ')
  end

  private
  def normalize_plaintext
    @text.downcase.gsub(/\W/, '')
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).to_a
  end
end