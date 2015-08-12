require 'pry-byebug'
require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'
require 'sinatra/flash'

enable :sessions

get '/' do
  @counts = Count.all
  erb :index
end

post '/create' do
  @count = Count.create(
    name: params[:name],
  )

  if @count.save
    flash[:message] = "Create Successfully!"
    redirect '/'
  else
    flash[:message] = "Invalid name. Please input name!"
    redirect '/'
  end
end

post '/:id/count_up' do
  @count = Count.find(params[:id])
  @count.number += 1

  @count.save
  redirect '/'
end

post '/:id/update' do
  @count = Count.find_by(id: params[:id])
  @count.try(:update, count_params)

  redirect '/'
end

post '/:id/destroy' do
  @count = Count.find_by(id: params[:id])
  @count.try(:delete)

  redirect '/'
end
