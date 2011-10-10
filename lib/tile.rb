class Tile
  attr_reader :x, :y
  attr_accessor :code

  def initialize(x,y,code='0')
    @code = code
    @x = x
    @y = y
    @available = true
    @parent = nil
  end

  def belongs_to(parent)
    @parent = parent
  end

  def code
    @parent.nil? ? @code : @parent.code
  end

  def available?
    @available
  end
end
