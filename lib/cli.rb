
class CLI
  def run
    self.welcome
    Scraper.scrape_players
    loop do
      user_input = main_menu
      if user_input == 'exit'
        puts "    ----------Cheers to another great season!!----------"
        return
      elsif user_input =='y'
        self.list_players
        self.choose_player
      else
        puts "You have preesed an invalid key. Please try again !!"
      end
    end
  end

  def welcome
    puts "================== Welcome fans of Manchester United! =========================\n\n"
  end

  def main_menu
    puts "Would you like to see the current team? Press 'Y' or 'exit' to exit"
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
    Scraper.scrape_bio(player)
    
    self.display_player_info(player)
    puts "Player info retreived from 'https://www.premierleague.com'"
    puts "Retreiving more info about player ...."
    sleep(4)
    self.display_player_bio(player)
    puts "Player bio retreived from 'https://www.manutd.com'"
  end
  
  def display_player_info(player)
    puts "\n"
    puts "Name: " + "#{player.name}".colorize(:red)
    puts "Position: " + "#{player.position}".colorize(:red)
    puts "Jersey_number: " + "#{player.jersey_number}".colorize(:red)
    puts "Country: " + "#{player.country}".colorize(:red)
    puts "Date of Birth (Age): " + "#{player.dob}".colorize(:red)
    puts "Heigth: " + "#{player.height}".colorize(:red)
    puts "Weight: " + "#{player.weight}".colorize(:red)
    puts "\n"
  end
  
  def display_player_bio(player)
    puts "#{player.bio}".colorize(:green)
  end


 end
 
