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
    self
  end

  def density
    return (@cells.size/1.2)
  end

  def build_grid
    (0..(@height - CELLS)).step(CELLS) do |x|
      (0..(@width - CELLS)).step(CELLS) do |y|
        @cells << Cell.build(x,y,@tiles)
      end
    end
  end

  def build_rooms
    cells = @cells.sort_by{ @seed.rand }.slice(density...@cells.size)
    cells.each do |cell|
      room_width = random_room_width
      room_height = random_room_height
      room_x = @seed.rand(0..(Cell.max_cell_width - room_width))
      room_y = @seed.rand(0..(Cell.max_cell_height - room_height))
      Room.new(room_x, room_y, room_width, room_height, cell).build
      cell.occupied
    end
  end

  def to_s
    @tiles.collect {|row| row.collect {|tile| tile.code}.join}.join("\n")
  end

  private

  def random_room_width
    @seed.rand(Cell.min_cell_width..Cell.max_cell_width)
  end

  def random_room_height
    @seed.rand(Cell.min_cell_height..Cell.max_cell_height)
  end

  def generate_random_seed(seed)
    return Random.new(seed) unless seed.nil?
    seed = Random.new.rand(20000000)
    Random.new(seed)
  end
end
