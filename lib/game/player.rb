class Player
  
  Width   = 10
  Height  = 75
  Speed   = 10
  
  attr_accessor :y
  attr_reader :x, :score

  def initialize(game, x, y)
    @game, @x, @y = game, x, y
    @score = 0
    @height = Height
  end
  
  def score!
    @score += 1
  end
  
  def rect
    Rect.new(@x, @y, Width, @height)
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
    @game.draw_quad @x, @y, Gosu::Color::WHITE,
                    @x + Width, @y, Gosu::Color::WHITE,
                    @x, @y + @height, Gosu::Color::WHITE,
                    @x + Width, @y + @height, Gosu::Color::WHITE
  end

end