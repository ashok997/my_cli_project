class Player
  attr_accessor :name, :position, :player_url, :jersey_number, :country, :dob, :height, :weight, :bio
  
  
  @@all =[]
  
  def initialize(player_hash)
    player_hash.each {|key, value| self.send(("#{key}="), value)}
    self.class.all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_by_number(number)
    self.all.find {|player| player.jersey_number==number}
    
  end
  
end




