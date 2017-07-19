#mapping to /restaurants which is definied
#in config.ru

class RestaurantController < Sinatra::Base
	get '/' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	Restaurant.all.to_json #active record method all
end

get '/:id/:token' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json

	user = User.find_by({token: token})

	id = params[:id]
	token = params[:token]

	if user
		restaurant = Restaurant.find(id)
		menus = Restaurant.menus #makes a join on restaurant and menu so that they can relate
		{restaurant: restaurant, menus: menus}.to_json
	else
		"ACCESS DENIED."
	end
end

post '/' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	request_body = JSON.parse(request.body.read)
	restaurant = Restaurant.new(request_body)
	restaurant.save
	restaurant.to_json
end

patch '/:id' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	id = params[:id]
	restaurant = Restaurant.find(id)
	request_body = JSON.parse(request.body.read)
	restaurant.update_attributes(request_body)
	restaurant.save
	restaurant.to_json
end

delete '/:id' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	id = params[:id]
	restaurant = Restaurant.find(id)
	restaurant.destroy
	restaurants = Restaurant.all
	restaurants.to_json
end
end
