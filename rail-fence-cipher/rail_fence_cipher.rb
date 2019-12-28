class RailFenceCipher
  def self.encode(message, stages)
    return message if stages == 1
    zig_zag = stages * 2 - 2
    middle_zig_zag = zig_zag / 2
    array = []
    message.chars.each_with_index do |char, i|
      if i % zig_zag <= middle_zig_zag
        stage = i % zig_zag
      else
        stage = (i % zig_zag - (middle_zig_zag * 2)).abs
      end
      array << [char, stage]
    end
    zig_zag_array = []
    (0..stages).each do |stage|
      array.each do |char, num|
        zig_zag_array << char if num == stage
      end
    end
    zig_zag_array.join
  end

  def self.decode(message, stages)
    return message if stages == 1
    zig_zag = stages * 2 - 2
    middle_zig_zag = zig_zag / 2
    p message.size
  end
end