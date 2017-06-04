require_relative 'contact'
require 'sinatra'

get '/' do #root
@contact_list = Contact.all
  erb :index
end

get '/contacts' do
  @contact_list = Contact.all

  @link = "https://www.facebook.com"

  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
