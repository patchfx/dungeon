class Tile
  attr_reader :x, :y
  attr_accessor :code

  def initialize(x,y,code='0')
    @code = code
    @x = x
    @y = y
    @available = true
  end

  def available?
    @available
  end
end
