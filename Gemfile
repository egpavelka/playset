source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.1'
# Use Puma as the app server
gem 'puma', '>= 3.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Autoprefixer
gem 'autoprefixer-rails', '>= 6.6.1'
# Add paging to datasets
gem 'will_paginate'
# Use Bootstrap for modularity
gem 'bootstrap-sass', '>= 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 5.0'
# Tooltips and popovers require tether
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '>= 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '>= 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 2.5'
# Fill database with random data for testing
gem 'faker'

# Use ActiveModel has_secure_password
gem 'bcrypt', '>= 3.1.7'

# Use HTTParty to manage external API calls
gem 'httparty', '>= 0.14.0'
# Nokogiri to scrape data from pages
gem 'nokogiri'
# Capybara to simulate application browser usage
gem 'capybara'
# Poltergeist to handle JS in Capybara instances
gem 'poltergeist'
# ... with PhantomJS
gem 'phantomjs'

# Embedding service API wrappers
gem 'soundcloud', '>= 0.3.4'
gem 'rspotify'

# Use Paperclip to upbload files
gem 'paperclip', '>= 5.1.0'
# Use Amazon S3 for image and audio storage
gem 'aws-sdk', '>= 2.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Generate data for testing
  # gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '>= 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '>= 2.0.0'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters', '1.1.9'
  gem 'guard', '2.13.0'
  gem 'guard-minitest', '2.4.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
