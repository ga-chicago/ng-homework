class FlightController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
		"TEST"
	end

	get '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		flights = Flight.all
		flights.to_json
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		flight = Flight.find(id)
		flight.to_json
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		response_body = JSON.parse(request.body.read)
		flight = Flight.new(response_body)
		flight.save
		flight.to_json
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		flight = Flight.find(id)
		new_flight = JSON.parse(request.body.read)
		flight.update_attributes(new_flight)
		flight.save
		Flight.all.to_json
	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		flight = Flight.find(id)
		flight.destroy
		Flight.all.to_json
	end

end