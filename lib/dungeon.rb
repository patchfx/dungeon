require File.expand_path(File.join(File.dirname(__FILE__), '../lib/tile.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/cell.rb'))

class Dungeon
  attr_reader :tiles, :width, :height, :cells
  CELLS = 5

  def initialize(width, height, seed=nil)
    @tiles = Array.new(height) { |y| Array.new(width) { |x| Tile.new(x,y)}}
    @width = width
    @height = height
    @cells = []
  end

  def generate
    build_grid
  end

  def max_cell_width
    CELLS - 1
  end

  def max_cell_height
    max_cell_width
  end

  def build_grid
    (0..35).step(CELLS) do |x|
      (0..15).step(CELLS) do |y|
        point_1 = [@tiles[x][y].y, @tiles[x][y].x]
        point_2 = [@tiles[x+max_cell_width][y].y, @tiles[x+max_cell_width][y].x]
        point_3 = [@tiles[x][y+max_cell_height].y, @tiles[x][y+max_cell_height].x]
        point_4 = [@tiles[x+max_cell_width][y+max_cell_height].y, @tiles[x+max_cell_width][y+max_cell_height].x]
        @cells << Cell.new(point_1, point_2, point_3, point_4)
      end
    end
  end

  def to_s
    @tiles.collect {|row| row.collect {|tile| tile.code}.join}.join("\n")
  end
end
