require File.expand_path(File.join(File.dirname(__FILE__), '../lib/tile.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/cell.rb'))

class Array
  def every(n)
    select {|x| index(x) % n == 0}
  end
end

class Dungeon
  attr_reader :tiles, :width, :height, :cells
  def initialize(width, height, seed=nil)
    @tiles = Array.new(height) { |y| Array.new(width) { |x| Tile.new(x,y)}}
    @width = width
    @height = height
    @cells = []
  end

  def build_grid
    (0..35).step(5) do |x|
      (0..15).step(5) do |y|
        point_1 = [@tiles[x][y].y, @tiles[x][y].x]
        point_2 = [@tiles[x+4][y].y, @tiles[x+4][y].x]
        point_3 = [@tiles[x][y+4].y, @tiles[x][y+4].x]
        point_4 = [@tiles[x+4][y+4].y, @tiles[x+4][y+4].x]
        @cells << Cell.new(point_1, point_2, point_3, point_4)
      end
    end
  end

  def to_s
    @tiles.collect {|row| row.collect {|tile| tile.code}.join}.join("\n")
  end
end
