require_relative 'contact'
require 'sinatra'

get '/' do #root
  erb :index
end

get '/contacts' do
  @contact_list = Contact.all
  @link = "https://www.facebook.com"
  erb :contacts
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
