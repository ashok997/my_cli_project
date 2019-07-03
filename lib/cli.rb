
class CLI
  def run
    self.welcome
    Scraper.scrape_players
    loop do
      user_input = main_menu
      if user_input == 'exit'
        return
      else
        self.list_players
        self.choose_player
      end
    end
  end

  def welcome
    puts "Welcome fans of Manchester United!\n\n"
  end

  def main_menu
    puts "Would you like to see team? Press Y or exit to exit"
    input = gets.strip.downcase
    return input
  end
  
  def list_players
    Player.all.each_with_index {|player, i| puts "#{i+1}.""\t""#{player.name}""\t\t" "#{player.position}"}
  end
  
  def choose_player
    puts "Choose a player you want to know more about!"
    
    info = gets.strip.to_i-1
    player = Player.all[info]
    Scraper.scrape_info(player)
   # Scraper.scrape_bio(player)
    self.display_player_info(player)
  end
  
  def display_player_info(player)
    puts "\n"
    puts "Name: " + "#{player.name}"
    puts "Position: " + "#{player.position}"
    puts "Jersey_number: " + "#{player.jersey_number}"
    puts "Country: " + "#{player.country}"
    puts "Date of Birth (Age): " + "#{player.dob}"
    puts "Heigth: " + "#{player.height}"
    puts "Weight: " + "#{player.weight}"
   # puts "Bio: " + "#{player.bio}"
    puts "\n"

  end



 end
 
