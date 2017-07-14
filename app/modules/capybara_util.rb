require 'capybara'
require 'capybara/dsl'

module CapybaraUtil

  # Capybara.javascript_driver = :poltergeist
  #
  # Capybara.register_driver :poltergeist do |app|
  #   options = {js_errors: false}
  #   Capybara::Poltergeist::Driver.new(app, options)
  # end

  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: chrome, args: ['headless'])
  end

  def visit_page(url)
    session = Capybara::Session.new(:selenium_chrome)
    session.visit(url)
  end

end
