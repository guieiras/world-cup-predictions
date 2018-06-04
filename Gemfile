source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Rails
gem 'rails', '~> 5.2.0'

# Infrastructure
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'

# Frontend
gem 'font-awesome-rails', '~>4.7.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# API
gem 'jbuilder', '~> 2.5'

# Security
gem 'clearance'
gem 'pundit'

# Utilities
gem 'bootsnap', '>= 1.1.0', require: false

# General
gem 'rails-settings-cached'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'timecop'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
