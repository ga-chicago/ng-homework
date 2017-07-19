#mapping to /restaurant/menu which is definied
#in config.ru

class MenuController < Sinatra::Base

get '/' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	
	Menu.all.to_json #active record method all
end

get '/:id' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	id = params[:id]
	menu = Menu.find(id)
	restaurant = menu.restaurant
	{menu: menu, restaurant: restaurant}.to_json
end

post '/' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	request_body = JSON.parse(request.body.read)
	menu = Menu.new(request_body)
	menu.save
	menu.to_json
end

patch '/:id' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	id = params[:id]
	menu = Menu.find(id)
	request_body = JSON.parse(request.body.read)
	menu.update_attributes(request_body)
	menu.save
	menu.to_json
end

delete '/:id' do
	response['Access-Control-Allow-Origin'] = '*'
	content_type :json
	id = params[:id]
	menu = Menu.find(id)
	menu.destroy
	updated_menus = Menu.all
	updated_menus.to_json
end

end






