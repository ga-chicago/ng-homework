require 'bundler'
Bundler.require

require './controllers/RestaurantController.rb'
require './controllers/MenuController.rb'
require './controllers/UserController.rb'

require './models/RestaurantModel.rb'
require './models/MenuModel.rb'
require './models/ReservationModel.rb'
require './models/UserModel.rb'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'chicagorestaurants'
	)

map('/restaurants'){run RestaurantController};
map('/menu'){run MenuController};
map('/users'){run UserController};