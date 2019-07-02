class Scraper
  
  #class for scrapping
URL='https://www.premierleague.com/clubs/12/Manchester-United/squad'



def self.scrape_players
   page = Nokogiri::HTML(open(URL))
  
  i=0
  player_list = page.css('ul.squadListContainer.squadList a')
  player_list.each do |player|
    player_hash = {
	    name: page.css('ul.squadListContainer.squadList .name')[i].text, 
  	  position: page.css('.position')[i].text,
  	  jersey_number: page.css('li span.number')[i].text,
  	  player_url:  page.css('ul.squadListContainer.squadList a')[i].attr('href')
    }
  	i+=1
  	Player.new(player_hash)
  end
end

def self.scrape_info(player)
    #https://www.premierleague.com/players/4330/David-de-Gea/overview
    url = "https://www.premierleague.com"+"#{player.player_url}"
    info_page = Nokogiri.HTML(open(url))
    binding.pry
  end
  



end

