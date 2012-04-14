class Ball
  include Rect

  Size = 20
  InitialSpeed = 3.0
  
  def initialize
    @speed = InitialSpeed
    @width, @height = Size, Size
    @color = Gosu::Color.argb(GameWindow::PaddleColor)
    reset!
  end
    
  def reset!
    @x, @y = (GameWindow::Width / 2) - (Size / 2), (GameWindow::Height / 2) - (Size / 2)
    @hdir = rand(2)
    @vdir = rand(2) #random_angle
    @speed = InitialSpeed
  end
  
  def random_angle
    rand(2) == 1 ? rand(45) : 0 - rand(45)
  end
  
  def update
    out_of_bounds?
    collides?
    
    if @hdir == 0
      @x += speed
    else
      @x -= speed
    end
    
    if @vdir == 0
      @y += speed
    else
      @y -= speed
    end
  end
  
  def speed
    @speed.round
  end
  
  def collides?
    if self.clips?(GameWindow.current.player1)
      @hdir = 0
      @speed += 0.2
    end
    
    if self.clips?(GameWindow.current.player2)
      @hdir = 1
      @speed += 0.2
    end
  end
  
  def out_of_bounds?
    if @y <= 0
      @vdir = 0
    elsif @y >= (GameWindow::Height - Size)
      @vdir = 1
    end
    
    if @x <= 0
      @hdir = 0
      GameWindow.current.score!(1)
      reset!
    elsif @x >= (GameWindow::Width - Size)
      @hdir = 1
      GameWindow.current.score!(0)
      reset!
    end
  end
  
  def draw
    GameWindow.current.draw_quad @x, @y, @color,
                    @x + Size, @y, @color,
                    @x, @y + Size, @color,
                    @x + Size, @y + Size, @color
  end
  
end