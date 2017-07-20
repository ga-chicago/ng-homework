require 'bundler'
Bundler.require

require './controllers/FlightController'
require './controllers/PassengerController'

require './models/FlightModel'
require './models/PassengerModel'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'airline'
)

map('/flights'){run FlightController}
map('/passengers'){run PassengerController}



