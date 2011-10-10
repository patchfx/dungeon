class Cell
  CELLS = 5

  def initialize(x1,x2,y1,y2)
    @x1 = [x1.y, x1.x]
    @x2 = [x2.y, x2.x]
    @y1 = [y1.y, y1.x]
    @y2 = [y2.y, y2.x]
    @occupied = false
    @tiles = Array.new(CELLS) { |x| Array.new(CELLS) { |x| nil } }
  end

  def add_tiles(tiles)
    CELLS.times do |y|
      CELLS.times do |x|
        tile = tiles[@x1[0]+y][@x1[1]+x]
        tile.belongs_to(self)
        @tiles[y][x] = tile
      end
    end
  end

  def code
    'C'
  end

  def self.build(x,y,tiles)
    cell = Cell.new(tiles[x][y],
                    tiles[x+max_cell_width][y],
                    tiles[x][y+max_cell_height],
                    tiles[x+max_cell_width][y+max_cell_height])
    cell.add_tiles(tiles)
    cell
  end

  def add_room(room, x, y, width, height)
    height.times do |i|
      width.times do |j|
        @tiles[i + y][x + j].belongs_to(room)
      end
    end
  end

  def self.max_cell_width
    CELLS - 1
  end

  def self.min_cell_height
    CELLS - 1
  end

  def self.min_cell_width
    min_cell_height
  end

  def self.max_cell_height
    max_cell_width
  end

  def occupied
    @occupied = true
  end

  def occupied?
    @occupied
  end

  def unoccupied?
    !occupied?
  end
end
