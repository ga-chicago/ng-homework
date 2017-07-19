class PersonController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
		200
	end

	get '/' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		people = Person.all.sort_by {|person| person.id}
		people.to_json
	end

	get '/:id' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		id = params[:id]
		Person.find(id).to_json
	end

	post '/' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		request_body = JSON.parse(request.body.read)
		person = Person.new(request_body)
		person.save
		person.to_json
	end

	patch '/:id' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		id = params[:id]
		request_body = JSON.parse(request.body.read)
		person = Person.find(id)
		person.update_attributes(request_body)
		person.save
		people = Person.all.sort_by {|person| person.id}
		people.to_json
	end

	delete '/:id' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		id = params[:id]
		person = Person.find(id)
		person.destroy
		people = Person.all.sort_by {|person| person.id}
		people.to_json
	end
end