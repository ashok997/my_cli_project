class Scrapper
  
  #class for scrapping
site = "https://www.manutd.com/en/players-and-staff/first-team"

def self.scrape_players
  page = Nokogiri::HTML(open(site))
  #puts page.css (".mu-content")[0]
  puts page.css ("div.mu-item team-card")[0]
  puts page.css ("div.team-grid__item ng-scope")[0]
  
end

def self.scrape_bio(player)
  #code to scrape player scrape_bio
  
  #page = Nokogiri::HTML(open(player_site))
  
end





  
end