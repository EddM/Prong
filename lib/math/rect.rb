module Rect
  
  attr_reader :x, :y, :width, :height, :bottom, :right
  
  def clips?(rect)
    rx, ry = rect.x, rect.y 
    !(rx > (@x + width) || (rx + rect.width) < @x || ry > (@y + height) || (ry + rect.height) < @y)
  end
  
end