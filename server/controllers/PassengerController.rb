class PassengerController < Sinatra::Base

	get '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		passengers = Passenger.all
		passengers.to_json
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		passenger = Passenger.find(id)
		passenger.to_json
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		request_body = JSON.parse(request.body.read)
		passenger = Passenger.new(request_body)
		passenger.save
		passenger.to_json
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		passenger = Passenger.find(id)
		new_passenger = JSON.parse(request.body.read)
		passenger.update_attributes(new_passenger)
		passenger.save
		Passenger.all.to_json
	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		passenger = Passenger.find(id)
		passenger.destroy
		Passenger.all.to_json
	end

end