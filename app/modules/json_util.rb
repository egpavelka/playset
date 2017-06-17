require 'httparty'
require 'nokogiri'
require 'open-uri'
require 'date'

# Methods available to multiple classes for handling data from external sources.

module JsonUtil

## FETCH DATA
  def api_call(url)
    response = HTTParty.get(url)
    response.parsed_response
  end

  def page_scraper(url)
    Nokogiri::HTML(open(url))
  end

## PROCESS DATA
  def year_from_date(date, date_format)
    !date.nil? ? Date.strptime(date.to_s, date_format).year : ''
  end

end
