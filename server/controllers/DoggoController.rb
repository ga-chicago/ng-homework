class DoggoController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
		200
	end

	get '/' do 
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		Doggo.all.to_json
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		doggo = Doggo.find(id)
		doggo.to_json
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		doggo_info = JSON.parse(request.body.read)
		doggo = Doggo.new(doggo_info)
		doggo.save
		doggo.to_json
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		doggo = Doggo.find(id)
		doggo_info = JSON.parse(request.body.read)
		doggo.update_attributes(doggo_info)
		doggo.save
		Doggo.all.to_json
	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		doggo = Doggo.find(id)
		doggo.destroy
		Doggo.all.to_json
	end
end

