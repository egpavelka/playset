require 'open-uri'
require 'httparty'
require 'nokogiri'
require 'date'

# Methods available to multiple classes for handling data from external sources.

module DataGrabUtil

## FETCH DATA
  def file_from_url(url)
    URI.parse(url)
  end

  def read_json(url)
    response = HTTParty.get(url)
    response.parsed_response
  end

  def read_page(url)
    Nokogiri::HTML(open(url))
  end

## PROCESS DATA
  def year_from_date(date, date_format)
    !date.nil? ? Date.strptime(date.to_s, date_format).year : ''
  end

end
