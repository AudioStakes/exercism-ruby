class Bst
  attr_reader :root, :point
  def initialize(number)
    @root = Node.new(number)
    @point = root
  end

  def insert(number)
    @inserted = false
    @insert_point = root
    while !@inserted do
      if @insert_point.number < number
        if @insert_point.right.nil?
          @insert_point.right = Node.new(number)
          @inserted = true
        else
          @insert_point = @insert_point.right
        end
      else
        if @insert_point.left.nil?
          @insert_point.left = Node.new(number)
          @inserted = true
        else
          @insert_point = @insert_point.left
        end
      end
    end
  end

  def data
    point.number
  end

  def left
    point.left
  end

  def right
    point.right
  end

  def each
    if block_given?
      root.list.each { |n| yield n}
    else
      root.list.map!
    end
  end
end

class Node
  attr_reader :number
  attr_accessor :left, :right
  def initialize(number)
    @number = number
    @left = nil
    @right = nil
  end

  def data
    number
  end

  def list
    if self.left
      left = self.left.list
    else
      left = []
    end
    center = [self.number]
    right = self.right.list if self.right
    if self.right
      right = self.right.list
    else
      right = []
    end
    left + center + right
  end
end