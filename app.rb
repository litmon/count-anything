require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

get '/' do
  @counts = Count.all
  erb :index
end

post '/count/create' do
  @count = Count.create(count_params)
  if @count.save
    redirect_to '/', notice: 'Create Successfull!!'
  else
    redirect_to '/', notice: 'Please input valid params!!'
  end
end
