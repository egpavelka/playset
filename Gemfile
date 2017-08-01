source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Re-add jquery ugh
gem 'jquery-rails'
# Autoprefixer
gem 'autoprefixer-rails', '>= 6.6.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Add paging to datasets
gem 'will_paginate'
# Use Bootstrap for modularity
gem 'bootstrap-sass', '>= 3.3.6'
# Tooltips and popovers require tether
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Extend webpacker React support to make passing data from Rails easier
gem 'react-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use HTTParty to manage external API calls
gem 'httparty', '>= 0.14.0'
# Nokogiri to scrape data from pages
gem 'nokogiri'
# Poltergeist as JS driver for Capybara
gem 'poltergeist'
gem 'geckodriver-helper'

# Embedding service API wrappers
gem 'soundcloud', '>= 0.3.4'
gem 'rspotify'
gem 'yt'

# Use Paperclip to upbload files
gem 'paperclip', '>= 5.1.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Generate fake data population
  gem 'faker'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# group :test do
#   gem 'rails-controller-testing', '0.1.1'
#   gem 'minitest-reporters', '1.1.9'
#   gem 'guard', '2.13.0'
#   gem 'guard-minitest', '2.4.4'
# end

group :production do
  # Use Amazon S3 for image and audio storage
  gem 'aws-sdk', '>= 2.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
