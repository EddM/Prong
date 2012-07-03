class GameWindow < Gosu::Window
  
  Offset = 20
  Width = 640
  Height = 480
  
  RightBoundary = (Width - Ball::Size)
  BottomBoundary = (Height - Ball::Size)
  
  ScoreColor = 0xffffff00
  PaddleColor = 0xffffffff
  
  attr_reader :player1, :player2, :audio
  
  def initialize
   super(Width, Height, false)
   self.caption = 'Prong'
   @@current = self
   
   @player1 = Player.new(Offset, Offset)
   @player2 = Player.new(Width - Offset - Player::Width, Height - Offset - Player::Height)
   @ball = Ball.new
   @font = Gosu::Font.new(self, Gosu::default_font_name, 32)
   @middle = Width / 2
   @audio = AudioLibrary.new
  end
  
  def draw
    @player1.draw
    @player2.draw
    @ball.draw
    
    draw_scores
    draw_net
  end
  
  def draw_scores
    player1_score = @player1.score.to_s
    player2_score = @player2.score.to_s
    @font.draw player1_score, (Width * 0.25) - (@font.text_width(player1_score) / 2), 10, 1, 1.0, 1.0, ScoreColor
    @font.draw player2_score, (Width * 0.75) - (@font.text_width(player2_score) / 2), 10, 1, 1.0, 1.0, ScoreColor
  end
  
  def draw_net
    draw_line @middle, 0, 0x55ffffff, @middle, Height, 0x55ffffff
  end
  
  def update
    move_players
    quit if button_down?(Gosu::KbEscape)
    @ball.update
  end
  
  def move_players
    @player1.move_down  if button_down?(Gosu::KbS)
    @player1.move_up    if button_down?(Gosu::KbW)
    @player2.move_down  if button_down?(Gosu::KbDown)
    @player2.move_up    if button_down?(Gosu::KbUp)
  end
  
  def quit
    exit(0)
  end
  
  def score!(player)
    self.instance_variable_get("@player#{player + 1}").score!
  end
  
  def self.current
    @@current
  end
  
end