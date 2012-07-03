class Player
  include Rect
  
  Width = 10
  Height = 75
  Speed = 10
  
  attr_accessor :y
  attr_reader :x, :score

  def initialize(x, y)
    @x, @y = x, y
    @width, @height = Width, Height
    @score = 0
    @window = GameWindow.current
  end
  
  def score!
    @score += 1
  end

  def move_down
    @y += Speed unless (@y + 1) >= (GameWindow::Height - @height)
  end
  
  def move_up
    @y -= Speed unless (@y - 1) <= 0
  end
  
  def draw
    right, bottom = @x + Width, @y + @height
    @window.draw_quad @x, @y, Gosu::Color::WHITE, right, @y, Gosu::Color::WHITE, @x, bottom, Gosu::Color::WHITE, right, bottom, Gosu::Color::WHITE
  end

end