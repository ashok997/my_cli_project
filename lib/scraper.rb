class Scraper
  
  #class for scrapping
URL='https://www.premierleague.com/clubs/12/Manchester-United/squad'

def self.scrape_bio
  #page = Nokogiri::HTML(open(URL))

  binding.pry
  
end

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
end



  # def self.scrape_titles
  #   pg = open(BASE_URL)
  #   parsed_html = Nokogiri.HTML(pg)
  #   movie_lis =
  #     parsed_html.css(
  #       "h2:contains('Now Playing')~ul.visual-list.movie-list li.visual-item"
  #     )
  #   movie_lis.each do |li|
  #     input_args = {
  #       title: li.css('div.visual-detail a').text.strip,
  #       url: li.css('a')[0].attr('href')
  #     }
  #     Movie.new(input_args)
  #   end
  # end
