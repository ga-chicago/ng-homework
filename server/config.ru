require 'bundler'
Bundler.require

require './models/DoggoModel'

require './controllers/DoggoController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'kennel'
)

map('/doggos'){run DoggoController}