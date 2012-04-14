class GameWindow < Gosu::Window
  
  Offset = 20
  Width = 640
  Height = 480
  
  attr_reader :player1, :player2
  
  def initialize
   super(Width, Height, false)
   self.caption = 'Prong'
   
   @player1 = Player.new(self, Offset, Offset)
   @player2 = Player.new(self, Width - Offset - Player::Width, Height - Offset - Player::Height)
   @ball = Ball.new(self)
   @font = Gosu::Font.new(self, Gosu::default_font_name, 32)
  end
  
  def draw
    @player1.draw
    @player2.draw
    @ball.draw
    
    @font.draw @player1.score.to_s, (Width * 0.25) - (@font.text_width(@player1.score.to_s) / 2), 10, 1, 1.0, 1.0, 0xffffff00
    @font.draw @player2.score.to_s, (Width * 0.75) - (@font.text_width(@player2.score.to_s) / 2), 10, 1, 1.0, 1.0, 0xffffff00
    
    draw_line Width / 2, 0, 0x55ffffff, Width / 2, Height, 0x55ffffff
  end
  
  def reset_ball!
    @ball.reset!
  end
  
  def update
    @player1.move_down  if button_down?(Gosu::KbS)
    @player1.move_up    if button_down?(Gosu::KbW)
    @player2.move_down  if button_down?(Gosu::KbDown)
    @player2.move_up    if button_down?(Gosu::KbUp)
    
    @ball.update
  end
  
  def score!(player)
    if player == 0
      @player1.score!
    else
      @player2.score!
    end
  end
  
end