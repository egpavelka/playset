source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 3.2.0'
gem 'webpacker'
gem 'graphql'
# gem 'redis', '~> 3.0'
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
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  # Use Amazon S3 for image and audio storage
  gem 'aws-sdk', '>= 2.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'graphiql-rails', '1.4.4', group: :development
