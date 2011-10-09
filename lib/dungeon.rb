require File.expand_path(File.join(File.dirname(__FILE__), '../lib/tile.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/cell.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/room.rb'))

class Dungeon
  attr_reader :tiles, :width, :height, :cells
  CELLS = 5

  def initialize(width, height, seed=nil)
    @tiles = Array.new(height) { |y| Array.new(width) { |x| Tile.new(x,y)}}
    @width = width
    @height = height
    @seed = generate_random_seed(seed)
    @cells = []
  end

  def generate
    build_grid
    build_rooms
  end

  def density
    return (@cells.size/1.2)
  end

  def max_cell_width
    CELLS - 1
  end

  def min_cell_height
    CELLS - 1
  end

  def min_cell_width
    min_cell_height
  end

  def max_cell_height
    max_cell_width
  end

  def build_grid
    (0..(@height - CELLS)).step(CELLS) do |x|
      (0..(@width - CELLS)).step(CELLS) do |y|
        point_1 = [@tiles[x][y].y, @tiles[x][y].x]
        point_2 = [@tiles[x+max_cell_width][y].y, @tiles[x+max_cell_width][y].x]
        point_3 = [@tiles[x][y+max_cell_height].y, @tiles[x][y+max_cell_height].x]
        point_4 = [@tiles[x+max_cell_width][y+max_cell_height].y, @tiles[x+max_cell_width][y+max_cell_height].x]
        @cells << Cell.new(point_1, point_2, point_3, point_4)
      end
    end
  end

  def build_rooms
    cells = @cells.sort_by{ @seed.rand }.slice(density...@cells.size)
    cells.each do |cell|
      room_width = random_room_width
      room_height = random_room_height
      room_x = @seed.rand(0..(max_cell_width - room_width))
      room_y = @seed.rand(0..(max_cell_height - room_height))
      Room.new(room_x, room_y, room_width, room_height, cell).build
      cell.occupied
    end
  end

  def to_s
    @tiles.collect {|row| row.collect {|tile| tile.code}.join}.join("\n")
  end

  private

  def random_room_width
    @seed.rand(min_cell_width..max_cell_width)
  end

  def random_room_height
    @seed.rand(min_cell_height..max_cell_height)
  end

  def generate_random_seed(seed)
    return Random.new(seed) unless seed.nil?
    seed = Random.new.rand(20000000)
    Random.new(seed)
  end
end
