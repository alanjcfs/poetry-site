source 'https://rubygems.org'
# ruby '1.9.3', engine: 'jruby', engine_version: '1.7.4'
ruby '2.1.2'

gem 'rails', '4.1.6'
gem 'puma'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  # gem 'activerecord-jdbcsqlite3-adapter', platform: :jruby
  gem 'pry-rails'
  gem 'spring'
end

# platforms :jruby do
#   gem 'jruby-openssl'
# end

gem 'pg', platform: :ruby

group :production do
  gem 'rails_12factor'
  # gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby
end

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails'
gem 'coffee-rails'
gem 'turbolinks'
# gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'

group :test do
  gem 'minitest-spec-rails', branch: 'master', github: 'metaskills/minitest-spec-rails'
  gem 'guard-minitest'
end

gem 'jquery-rails'
gem 'kaminari', '~> 0.15'
gem 'ransack'
gem 'twitter', '~> 5.0'
gem 'nokogiri', require: false
gem 'newrelic_rpm'
gem 'slim-rails'
gem "devise", "~> 3.0"
gem 'pundit'

# redis for using RedisToGo, redis-rails for cache store
gem 'redis'
gem 'redis-rails'

gem 'skylight'

gem 'simple_form'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn', platform: :ruby

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
