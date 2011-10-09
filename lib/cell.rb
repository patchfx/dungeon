class Cell
  def initialize(x1,x2,y1,y2)
    @x1 = x1
    @x2 = x2
    @y1 = y1
    @y2 = y2
    @occupied = false
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
