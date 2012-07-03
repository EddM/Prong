class Ball
  include Rect

  Size = 20
  InitialSpeed = 3.0
  
  def initialize
    @window = GameWindow.current
    @speed = InitialSpeed
    @width, @height = Size, Size
    @color = Gosu::Color.argb(GameWindow::PaddleColor)
    reset!
  end
    
  def reset!
    midpoint = Size / 2
    @x, @y = (GameWindow::Width / 2) - midpoint, (GameWindow::Height / 2) - midpoint
    @hdir, @vdir = rand(2), rand(2)
    @speed = InitialSpeed
  end
  
  def update
    vertical_bounce
    out_of_bounds?
    collides?
    move!
  end
  
  def move!
    spd = speed
    
    if @hdir == 0
      @x += spd
    else
      @x -= spd
    end
    
    if @vdir == 0
      @y += spd
    else
      @y -= spd
    end
  end
  
  def speed
    @speed.round
  end
  
  def collides?
    change_horizontal_direction(0) if self.clips?(@window.player1)
    change_horizontal_direction(1) if self.clips?(@window.player2)
  end
  
  def change_horizontal_direction(dir)
    @window.audio.play!(:paddle)
    @hdir = dir
    speed_up
  end
  
  def change_vertical_direction(dir)
    @vdir = dir
    @window.audio.play!(:bounce)
  end
  
  def speed_up
    @speed += 0.2
  end
  
  def vertical_bounce
    if @y <= 0
      change_vertical_direction(0)
    elsif @y >= GameWindow::BottomBoundary
      change_vertical_direction(1)
    end
  end
  
  def score!(player)
    @window.score! player
    reset!
    @window.audio.play!(:point)
  end
  
  def out_of_bounds?
    if @x <= 0
      score! 1
    elsif @x >= GameWindow::RightBoundary
      score! 0
    end
  end
  
  def draw
    right, bottom = @x + Size, @y + Size
    GameWindow.current.draw_quad @x, @y, @color,
                    right, @y, @color,
                    @x, bottom, @color,
                    right, bottom, @color
  end
  
end