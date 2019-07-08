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
  	  player_url:  page.css('ul.squadListContainer.squadList a')[i].attr('href').unicode_normalize(:nfkd).encode('ASCII', replace: '')
    }
  	i+=1
  	Player.new(player_hash)
  end
end

def self.scrape_info(player)
    #https://www.premierleague.com/players/4330/David-de-Gea/overview
    url = "https://www.premierleague.com"+"#{player.player_url}" 
    info_page = Nokogiri.HTML(open(url))
    player.country = info_page.css("div .playerInfo .playerCountry").text 
    player.dob = info_page.css("div .playerInfo .pdcol2 .info").text.strip
    player.height = info_page.css("div .playerInfo .pdcol3 .info")[0] .text if  info_page.css("div .playerInfo .pdcol3 .info")[0]
    player.weight = info_page.css("div .playerInfo .pdcol3 .info")[1].text if info_page.css("div .playerInfo .pdcol3 .info")[1]
  end
  
  def self.scrape_bio(player)
    #https://www.manutd.com/en/players-and-staff/detail/david-de-gea
    url_name = player.name.gsub(" ","-").downcase.unicode_normalize(:nfkd).encode('ASCII', replace: '')
    url = "https://www.manutd.com/en/players-and-staff/detail/"+"#{url_name}"
    bio = Nokogiri.HTML(open(url))
    player.bio = bio.css("div .player-detail__bio .player-content .player-content__cta").text.strip
  end
  
end
