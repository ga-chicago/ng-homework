require 'bundler'
Bundler.require

require './models/CharacterModel'
require './controllers/CharacterController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'got'
)

map('/characters'){run CharacterController}