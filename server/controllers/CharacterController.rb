class CharacterController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, DELETE'
		200
	end

	get '/' do 
		response['Access-Control-Allow-Origin'] = '*'
	    content_type :json
	    characters = Character.all
	    characters.to_json	

	   
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
	    content_type :json
	    id = params[:id]
	    character = Character.find(id)
	    character.to_json
	    
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
	    content_type :json
	    request_body = JSON.parse(request.body.read)
	    character = Character.new(request_body)
	    character.save
	    character.to_json
	    
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
	    content_type :json
	    id = params[:id]
	    character = Character.find(id)
	    request_body = JSON.parse(request.body.read)
	    character.update_attributes(request_body)
	    character.save
	    characters = Character.all.sort_by {|character| character.id} 
	    characters.to_json
	    
	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
	    content_type :json
	    id = params[:id]
	    character = Character.find(id)
	    character.destroy
	    characters = Character.all.sort_by {|character| character.id} 
	    characters.to_json
	   
	end

end