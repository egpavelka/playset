require "test_helper"
require "capybara/poltergeist"
require "capybara/webkit"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  # Rack::Test
  # driven_by :rack_test

  # capybara-webkit
  # Capybara::Webkit.configure do |config|
  #   config.raise_javascript_errors = false
  # end
  # driven_by :webkit

  # Poltergeist
  # Capybara.register_driver :poltergeist do |app|
  #   Capybara::Poltergeist::Driver.new(app, js_errors: false)
  # end
  # driven_by :poltergeist

end
