class CLI
  def run
    self.welcome
    self.list_players
  end

  def welcome
    puts "Welcome fans of Manchester United!\n\n"
  end

  def list_players
    Scraper.scrape_players
    
    # Players {[Goalkeepers:][Defenders:][Midfielders:][Forwards:]}
    
  end
  
  def player_info(player) #Player has first_name,last_name,position,dob,date_joined,club_debut,bio
    puts player.first_name
    puts player.last_name
   # puts player.position
   # puts player.dob
   # puts player.date_joined
   # puts player.club_debut
  #  puts "\n\n"
  #  puts player.bio
  end

end
