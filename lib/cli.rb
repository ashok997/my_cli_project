
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
      end
    end
  end

  def welcome
    puts "Welcome fans of Manchester United!\n\n"
  end

  def main_menu
    puts 'Would you like to see team?'
    input = gets.strip.downcase
    return input
  end
  
  def list_players
    Player.all.each_with_index {|player, i| puts "#{i+1}.""\t""#{player.name}""\t\t" "#{player.position}"}
  end


end

