require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

module ScrapeWithPoltergeist

  Capybara.javascript_driver = :poltergeist

  Capybara.register_driver :poltergeist do |app|
    options = {js_errors: false}
    Capybara::Poltergeist::Driver.new(app, options)
  end

  def scrape(url)
    Capybara::Session.new(:poltergeist)
    visit(url)
  end



end
