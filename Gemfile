source 'https://rubygems.org'
ruby '1.9.3', engine: 'jruby', engine_version: '1.7.4'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'thin', platform: :ruby
  gem 'sqlite3', platform: :ruby
  gem 'activerecord-jdbcsqlite3-adapter', platform: :jruby
  gem 'pry-rails'
end

# platforms :jruby do
#   gem 'jruby-openssl'
# end

group :production do
  gem 'pg', platform: :ruby
  gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'minitest-rails'
end

gem 'jquery-rails'
gem 'kaminari'
gem 'ransack'
gem 'twitter'
gem 'nokogiri'
gem 'newrelic_rpm'
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'strong_parameters'
gem 'rails_admin'
gem 'cancan'
gem 'puma'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn', platform: :ruby

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'


gem "devise"
