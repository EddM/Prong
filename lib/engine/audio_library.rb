class AudioLibrary
  
  def initialize
    @window = GameWindow.current
    @sounds = { }
    
    Dir.glob("res/*.wav").each do |file|
      filename = file.split("/").last.split(".")[0]
      @sounds[filename.to_sym] = Gosu::Sample.new(@window, file)
    end
  end
  
  def play!(file)
    @sounds[file].play
  end
  
end