class Scraper
  
  #class for scrapping
URL="https://www.manutd.com/en/players-and-staff/first-team"

def self.scrape_players
  page = Nokogiri::HTML(open(URL))
  #puts page.css (".mu-content")[0]
  puts page.css ("div.mu-item team-card")[0]
  puts page.css ("div.team-grid__item ng-scope")[0]
  binding.pry
  
end

def self.scrape_bio(player)
  #code to scrape player scrape_bio
  
 
  
end





  
end