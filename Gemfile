# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'redis', '~> 4.0'
gem 'sass-rails', '>= 6'
gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'brakeman', '~> 4.8'
gem 'material_design_icons', '~> 4.1'

group :development, :test do
  gem 'byebug', platforms: [:mri]
  gem 'erb_lint', '= 0.0.32'
  gem 'factory_bot_rails', '~> 5.1'
  gem 'faker', '~> 2.11'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', '= 0.82.0'
  gem 'rubocop-rails', '~> 2.5'
  gem 'rubocop-rspec', '~> 1.5'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.3'
end
