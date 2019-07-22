
class CLI
  def run
    self.welcome
    loop do
      user_input = self.get_input
      if user_input == 'exit'
        puts yellow("  ----------Cheers to another great season!!----------")
        return
      elsif user_input =='y'
        self.print_squad_table
        self.choose_player
      else
        self.ask_for_input
      end
    end
  end

  def welcome
    puts yellow("================== Welcome fans of Manchester United! =========================\n\n")
    puts yellow("Would you like to see the current team? Press 'Y' or 'exit' to exit \n")
    Scraper.scrape_players
  end
  
  def get_input
    input = gets.strip.downcase
  end
  
  def ask_for_input
    puts yellow("Would you like to see the current team? Press 'y' to coninue")
    puts yellow("Press 'exit' to exit!")
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
    puts yellow("Choose a player you want to know more about!")
    puts yellow("To choose player by jersey number, type 'number'")
    input = self.get_input
    if input == "number"
      self.select_by_number
    elsif input.to_i > 0 && input.to_i < Player.all.length+1
      info = input.strip.to_i-1
      player = Player.all[info]
      self.scrape_and_display(player)
    else 
      puts yellow("You have pressed an invalid key. Please try again !!")
      self.choose_player
      return
    end
  end

  def display_player_info(player)
    puts "\n"
    puts "Name: " + red("#{player.name}")
    puts "Position: " + red("#{player.position}")
    puts "Jersey_number: " + red("#{player.jersey_number}")
    puts "Country: " + red("#{player.country}")
    puts "Date of Birth (Age): " + red("#{player.dob}")
    puts "Heigth: " + red("#{player.height}")
    puts "Weight: " + red("#{player.weight}")
    puts "\n"
    puts yellow("Player info retreived from 'https://www.premierleague.com/'")
  end
  
  def display_player_bio(player)
    puts "\n"
    puts "#{player.bio}".colorize(:green)
    puts "\n"
    puts yellow("Player bio retreived from 'https://www.manutd.com/'")
    puts "\n"
    self.ask_for_input
  end
  
  def select_by_number
    puts yellow("Enter the jesery number of player you are looking for ")
      info = self.get_input
      player = Player.find_by_number(info)
      if player == nil
        puts "Please refer to table again and check the number"
        self.select_by_number
      else
       self.scrape_and_display(player)
     end
  end
  
  def scrape_and_display(player)
    Scraper.scrape_info(player) if !player.country
    Scraper.scrape_bio(player) if !player.bio
    self.display_player_info(player)
    puts yellow("Retreiving more info about player ....")
    self.display_player_bio(player)
  end
  
  def yellow(string)
    string.colorize(:yellow)
  end
  
  def red(string)
    string.colorize(:red)
  end
  
  
end
