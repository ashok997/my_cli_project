class Player
  attr_accessor :name, :position, :player_url, :jersey_number, :country, :dob, :height, :weight
  
  
  @@all =[]
  
  def initialize(player_hash)
    player_hash.each {|key, value| self.send(("#{key}="), value)}
    self.class.all << self
  end
  
  def self.all
    @@all
  end
  
end




