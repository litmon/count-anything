# A sample Gemfile
source "https://rubygems.org"

gem 'rake'
gem 'sinatra',
  git: 'https://github.com/sinatra/sinatra.git',
  ref: '5f6168bfc92280892e819df524d4508cf9032f6d'
  # for https://github.com/sinatra/sinatra/issues/961
gem 'sinatra-contrib'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'sinatra-flash'
gem 'dotenv'
gem 'cloudinary'

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-byebug'
  gem 'racksh'
end

group :production do
  gem 'pg'
end
