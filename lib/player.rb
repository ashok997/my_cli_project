class Player
  attr_accessor :first_name, :last_name, :position, :dob, :date_joined, :club_debut, :bio
  
  @@all =[]
  
  def initialize(player_hash)
    
    @firtst_name = player_hash.firtst_name
    @last_name = player_hash.last_name
  
    self.class.all << self
  
  end
  
  def self.all
    @@all
  end
  
end




