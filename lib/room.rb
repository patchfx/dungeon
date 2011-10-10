class Room
  attr_reader :cell, :width, :height, :x, :y, :tiles
  def initialize(x,y,width,height,cell)
    @x = x
    @y = y
    @width = width
    @height = height
    @cell = cell
  end

  def code
    '#'
  end

  def build
    @cell.add_room(self, @x, @y, @width, @height)
  end
end
