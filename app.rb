require 'pry-byebug'
require 'bundler/setup'
Bundler.require
require 'sinatra/flash'
require 'sinatra/reloader' if development?

require './models/count'
require './image_uploader'

Dotenv.load

Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUD_NAME']
  config.api_key    = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
end

enable :sessions

get '/' do
  @counts = Count.all
  erb :index
end

post '/create' do
  @count = Count.create(
    name: params[:name],
  )

  image_upload(@count, :image, params[:image])

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
  if @count
    @count.update(name: params[:name]) if params[:name]
    image_upload(@count, :image, params[:image])
  end

  redirect '/'
end

post '/:id/destroy' do
  @count = Count.find_by(id: params[:id])
  @count.try(:delete)

  redirect '/'
end
