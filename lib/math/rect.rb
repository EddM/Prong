module Rect
  
  attr_reader :x, :y, :width, :height, :bottom, :right
  
  def clips?(rect)
    !(rect.x > (@x + width) || (rect.x + rect.width) < @x || rect.y > (@y + height) || (rect.y + rect.height) < @y)
  end
  
end