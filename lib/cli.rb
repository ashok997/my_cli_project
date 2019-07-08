
class CLI
  def run
    self.welcome
    Scraper.scrape_players
    loop do
      user_input = menu
      if user_input == 'exit'
        puts "    ----------Cheers to another great season!!----------".colorize(:yellow)
        return
      elsif user_input =='y'
        self.list_players
        self.choose_player
        
      else
        puts "You have preesed an invalid key. Please try again !!".colorize(:yellow)
      end
    end
  end

  def welcome
    puts "================== Welcome fans of Manchester United! =========================\n\n".colorize(:yellow)
    puts "Would you like to see the current team? Press 'Y' or 'exit' to exit \n".colorize(:yellow)
  end

  def menu
    input = gets.strip.downcase
    return input
  end
  
  def list_players
    puts "\n"
    Player.all.each_with_index {|player, i| puts "#{i+1}.""\t""#{player.name}""\t\t" "#{player.position}""\t""#{player.jersey_number}"}
    puts "\n"
  end
  
  def choose_player
    puts "Choose a player you want to know more about!".colorize(:yellow)
    puts "To choose player by jersey number, type 'number'".colorize(:yellow)
    
    input = menu
    
    if input == "number"
      puts "Enter the jesery number of player you are looking for ".colorize(:yellow)
      info = menu
      player = Player.find_by_number(info)
    elsif input.to_i > 0
      info = input.strip.to_i-1
      player = Player.all[info] 
    else 
    
      puts "You have preesed an invalid key. Please try again !!".colorize(:yellow)
      puts "Would you like to see the current team again? Press 'y' to coninue".colorize(:yellow)
      puts "Press 'exit' to exit!".colorize(:yellow)
      return
    end
  
    Scraper.scrape_info(player)
    Scraper.scrape_bio(player)
    
    self.display_player_info(player)
    puts "Retreiving more info about player ....".colorize(:yellow)
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
    puts "Player info retreived from 'https://www.premierleague.com/'".colorize(:yellow)

  end
  
  def display_player_bio(player)
    puts "\n"
    puts "#{player.bio}".colorize(:green)
    puts "\n"
    puts "Player bio retreived from 'https://www.manutd.com/'".colorize(:yellow)
    puts "\n"
    puts "Would you like to see the current team again? Press 'y' to coninue".colorize(:yellow)
    puts "Press 'exit' to exit!".colorize(:yellow)
  end


 end
 
