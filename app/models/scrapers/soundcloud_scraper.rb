page.xpath('//meta[@property="og:title"]/@content').text

def scrape_xpath(prop)
  xpath('//meta[@property="#{prop}"]/@content').text
end

values = [{
'text_data' => {
  :title => scrape_xpath("og:title"),
  :artist => ,
  :album => ,
  :year =>
  },
'album_art_url' => scrape_xpath("og:image")
},
self.player_url]
