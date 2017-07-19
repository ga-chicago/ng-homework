require 'bundler'
Bundler.require

require './models/PersonModel'
require './controllers/PersonController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'people'
)

map ('/people'){run PersonController}