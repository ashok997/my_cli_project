
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
    puts "Would you like to see the current team? Press 'Y' or 'exit' to exit \n"
  end

  def main_menu
    input = gets.strip.downcase
    return input
  end
  
  def list_players
    puts "\n"
    Player.all.each_with_index {|player, i| puts "#{i+1}.""\t""#{player.name}""\t\t" "#{player.position}""\t""#{player.jersey_number}"}
    puts "\n"
  end
  
  def choose_player
    puts "Choose a player you want to know more about!"
    puts "To choose player by jersey number, type 'number'"
    
    input = gets.strip.downcase
    
    if input == "number"
     # player = Player.find_by_number('7')
      puts "Enter the jesery number of player you are looking for "
      info = gets.chomp
      player = Player.find_by_number(info)
    else
      info = input.strip.to_i-1
      player = Player.all[info]
    end
  
    Scraper.scrape_info(player)
    Scraper.scrape_bio(player)
    
    self.display_player_info(player)
    puts "Retreiving more info about player ...."
    sleep(2)
    self.display_player_bio(player)
  
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
    puts "Player info retreived from 'https://www.premierleague.com/'"
  end
  
  def display_player_bio(player)
    puts "#{player.bio}".colorize(:green)
    puts "\n"
    puts "Player bio retreived from 'https://www.manutd.com/'"
    puts "\n"
    puts "Would you like to see the current team again? Press 'y' to coninue"
    puts "Press 'exit' to exit!"
  end


 end
 
