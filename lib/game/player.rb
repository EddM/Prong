class Player
  include Rect
  
  Width   = 10
  Height  = 75
  Speed   = 10
  
  attr_accessor :y
  attr_reader :x, :score

  def initialize(x, y)
    @x, @y = x, y
    @width, @height = Width, Height
    @score = 0
    @height = Height
  end
  
  def score!
    @score += 1
  end

  def move_down
    unless (@y + 1) >= (GameWindow::Height - @height)
      @y += Speed
    end
  end
  
  def move_up
    unless (@y - 1) <= 0
      @y -= Speed
    end
  end
  
  def draw
    right, bottom = @x + Width, @y + @height
    GameWindow.current.draw_quad @x, @y, Gosu::Color::WHITE,
                    right, @y, Gosu::Color::WHITE,
                    @x, bottom, Gosu::Color::WHITE,
                    right, bottom, Gosu::Color::WHITE
  end

end