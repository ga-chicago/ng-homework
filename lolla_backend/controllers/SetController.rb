class SetController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
		200
	end

	get '/' do

		response['Access-Control-Allow-Origin'] = '*'
		content_type :json

		sets = Sets.all.sort_by {|sets| sets.id}
		sets.to_json
		
	end

	get '/:id' do

		response['Access-Control-Allow-Origin'] = '*'
		content_type :json

		id = params[:id]

		set = Sets.find(id)
		set.to_json

	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json

		request_body = JSON.parse(request.body.read)

		set = Sets.new(request_body)

		set.save
		set.to_json

	end

	patch '/:id' do

		response['Access-Control-Allow-Origin'] = '*'
		content_type :json

		id = params[:id]
		set = Sets.find(id)
		set_info = JSON.parse(request.body.read)
		set.update_attributes(set_info)
		set.save
		sets = Sets.all.sort_by {|sets| sets.id}
		sets.to_json

	end

	delete '/:id' do

		response['Access-Control-Allow-Origin'] = '*'
		content_type :json

		id = params[:id]
		set = Sets.find(id)
		set.destroy
		sets = Sets.all.sort_by {|sets| sets.id}

		sets.to_json
		

	end


end