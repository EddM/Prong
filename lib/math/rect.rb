class Rect
  
  attr_reader :x, :y, :width, :height, :bottom, :right
  
  def initialize(x, y, width, height)
    @x, @y, @width, @height = x, y, width, height
    @right, @bottom = x + width, y + height
  end
  
  def clips?(rect)
    !(rect.x > @right || rect.right < @x || rect.y > @bottom || rect.bottom < @y)
  end
  
end