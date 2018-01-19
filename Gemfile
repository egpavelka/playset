source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Re-add jquery ugh
gem 'jquery-rails'
# Autoprefixerbundl
gem 'autoprefixer-rails', '>= 6.6.1'
# Use SCSS for stylesheets
# gem 'bootstrap-sass', '~> 3.3.7'
# gem 'sass-rails'
# Add paging to datasets
gem 'will_paginate'
# Use Bootstrap for modularity
gem 'bootstrap'
# Tooltips and popovers require tether
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.2.0'
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
gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use HTTParty to manage external API calls
gem 'httparty'
gem 'mechanize'
# Nokogiri to scrape data from pages
gem 'nokogiri'
# Adds support for Capybara system testing and selenium driver
gem 'capybara'
# gem 'selenium-webdriver'
# Poltergeist as JS driver for Capybara
gem 'poltergeist'

# Embedding service API wrappers
gem 'rspotify'
gem 'soundcloud', '>= 0.3.4'
gem 'vimeo_me2', git: 'https://github.com/bo-oz/vimeo_me2.git'
gem 'yt'

# Use Paperclip to upbload files
gem 'paperclip', '>= 5.1.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere to stop execution and get a debugg console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Generate fake data population
  gem 'faker'
  gem 'foreman'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running
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
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
