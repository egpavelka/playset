require 'open-uri'
require 'httparty'
require 'nokogiri'
require 'date'

# Methods available to multiple classes for handling data from external sources.

module DataGrabUtil

## FETCH DATA
  def self.file_from_url(url)
    open(url)
  end

  def self.read_json(url)
    response = HTTParty.get(url)
    response.parsed_response
  end

  def self.read_page(url)
    Nokogiri::HTML(open(url))
  end

## PROCESS DATA
  def self.year_from_date(date, date_format)
    !date.nil? ? Date.strptime(date.to_s, date_format).year : ''
  end

end
