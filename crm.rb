require_relative 'contact'
require 'sinatra'



get '/' do #root
  erb :index
end


after do
  ActiveRecord::Base.connection.close
end
