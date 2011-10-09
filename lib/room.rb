class Room
  attr_reader :cell, :width, :height, :x, :y, :tiles
  def initialize(x,y,width,height,cell)
    @x = x
    @y = y
    @width = width
    @height = height
    @cell = cell
    @tiles = []
  end

  def build
    @tiles = Array.new(@height) { |y| Array.new(@width) { |x| Tile.new(x,y,'#')}}
  end
end
