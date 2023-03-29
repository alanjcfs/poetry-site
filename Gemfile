source 'https://rubygems.org'
# ruby '1.9.3', engine: 'jruby', engine_version: '1.7.4'
ruby '3.0.5'

gem 'rails', '~> 6.1.0'
gem 'puma'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  # gem 'activerecord-jdbcsqlite3-adapter', platform: :jruby
  gem 'spring'
  gem 'listen'
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
  gem 'minitest-spec-rails'
  gem 'minitest-autotest'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-rails'
end

gem 'jquery-rails'
gem 'kaminari', '~> 1.2'
gem 'ransack'
gem 'twitter', '~> 6.0'
gem 'nokogiri', require: false
gem "devise", "~> 4.7"
gem 'pundit'

gem 'dalli'

gem 'simple_form'

gem 'ckeditor'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn', platform: :ruby

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'bootsnap'
