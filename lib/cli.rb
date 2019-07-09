
class CLI
  def run
    self.welcome
    Scraper.scrape_players
    loop do
      user_input = self.menu
      if user_input == 'exit'
        puts "    ----------Cheers to another great season!!----------".colorize(:yellow)
        return
      elsif user_input =='y'
        self.print_squad_table
        self.choose_player
      else
        puts "You have preesed an invalid key. Please try again !!".colorize(:yellow)
        puts "Press 'y' to see the current team or 'exit' to exit ".colorize(:yellow)
      end
    end
  end

  def welcome
    puts "================== Welcome fans of Manchester United! =========================\n\n".colorize(:yellow)
    puts "Would you like to see the current team? Press 'Y' or 'exit' to exit \n".colorize(:yellow)
  end

  def print_squad_table
    rows =[]
    
    Player.all.each_with_index do |player, i| 
      rows << ["#{i+1}.".colorize(:light_green), "#{player.name}".colorize(:blue), "#{player.position}".colorize(:red),"#{player.jersey_number}".colorize(:green)]
    end
    
    table = Terminal::Table.new :title => " Manchester United Squad 2019/20".colorize(:red), :headings => ["S.N.", "Name", "Position", "Jersey Number"], :rows => rows
    table.align_column(3, :center)
    table.align_column(2, :center)
    puts table
  end
  
  def choose_player
    puts "Choose a player you want to know more about!".colorize(:yellow)
    puts "To choose player by jersey number, type 'number'".colorize(:yellow)
    
    input = self.menu
    
    if input == "number"
      puts "Enter the jesery number of player you are looking for ".colorize(:yellow)
      info = self.menu
     
      player = Player.find_by_number(info)
      if player == nil
        puts "Please refer to table again and check the number"
        puts "Would you like to see the current team again? Press 'y' to coninue".colorize(:yellow)
        puts "Press 'exit' to exit!".colorize(:yellow)
        return
      end
    elsif input.to_i > 0 && input.to_i < Player.all.length+1
      info = input.strip.to_i-1
      player = Player.all[info] 
    else 
      puts "You have preesed an invalid key. Please try again !!".colorize(:yellow)
      puts "Would you like to see the current team again? Press 'y' to coninue".colorize(:yellow)
      puts "Press 'exit' to exit!".colorize(:yellow)
      return
    end

    Scraper.scrape_info(player) if player.country == nil
    Scraper.scrape_bio(player) if player.bio == nil
    
    self.display_player_info(player)
    puts "Retreiving more info about player ....".colorize(:yellow)
    self.display_player_bio(player)
  
  end
  
  def menu
    input = gets.strip.downcase
    return input
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
