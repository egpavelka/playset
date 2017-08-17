require 'capybara'
require 'poltergeist'

module CapybaraUtil

  Capybara.javascript_driver = :poltergeist

  Capybara.register_driver :poltergeist do |app|
    options = {js_errors: false}
    Capybara::Poltergeist::Driver.new(app, options)
  end

  # Capybara.register_driver :selenium do |app|
  #   Capybara::Selenium::Driver.new(app, browser: :selenium_chrome_headless, args: ['headless'])
  # end
  #
  # Capybara.javascript_driver = :selenium_chrome_headless
  #
  # def visit_page(url)
  #   session = Capybara::Session.new(:selenium_chrome_headless)
  #   session.visit(url)
  # end

end
