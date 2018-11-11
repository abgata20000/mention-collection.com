source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'webpacker'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


gem 'active_decorator'
gem 'active_decorator_with_decorate_associations'
gem 'active_hash'
gem 'active_type'
gem 'baby_squeel'
gem 'bugsnag'
gem 'default_value_for'
gem 'dotenv-rails'
gem 'enumerize', github: 'brainspec/enumerize'
gem 'kaminari'
gem 'rack-user_agent'
gem 'ransack', '1.8.8'
gem 'ridgepole'
gem 'simple_form'
gem 'slim-rails'
gem 'acts_as_paranoid', '~> 0.6.0'
gem 'scaffoldable', git: 'https://github.com/radicodeinc/scaffoldable.git'
gem 'sinatra', require: false
# slack
gem 'slack-notifier'
gem 'activerecord-import'

group :test, :development do
  gem 'binding_of_caller'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'brakeman'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'database_rewinder'
  gem 'delorean'
  gem 'launchy', '~> 2.4.2'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter', '0.2.2' # for circleci
  gem 'rubocop'
  gem 'meowcop'
  gem 'selenium-webdriver', '~> 3.4.1'
  gem 'simplecov'
  gem 'chromedriver-helper'
  gem 'rspec-retry'
  gem 'timecop'
end

group :development, :staging, :review_app do
  gem 'letter_opener'
  gem 'letter_opener_web'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  gem 'pry'
  gem 'pry-rails'
  gem 'rails_layout', github: 'RailsApps/rails_layout'
  gem 'seed_dump'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'view_source_map'
end

group :test, :development, :staging, :review_app do
  gem 'gimei'
  gem 'takarabako'
end

group :production, :staging , :development do
  gem 'sendgrid-actionmailer'
end

group :review_app, :staging , :development do
  gem 'better_errors'
end
