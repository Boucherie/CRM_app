require_relative 'contact'
require 'sinatra'

get '/' do #root
  erb :index
end

get '/contacts' do
  @contact_list = Contact.all
  erb :contacts
end

after do
  ActiveRecord::Base.connection.close
end
