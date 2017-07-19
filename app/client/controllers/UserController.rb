require 'SecureRandom'

class UserController < Sinatra::Base

	
	get '/:id/:token' do
		token = params[:token]
		id = params[:id]
		logged_in_user = User.find_by(token: token)
		if logged_in_user.id == id
			user = User.find(id)
			menus = user.menus
			{user: user, menus: menus}.to_json
		else
			{response: "ACCESS DENIED"}.to_json
		end
	end



	post '/' do

	end
	
	post '/register' do
		user_details = JSON.parse(request.body.read)
		user = User.new(user_details)

		user.username = user_details["username"]
		user.password = user_details["password"]
		user.token = SecureRandom.hex

		user.save
		user.to_json
	end

	post '/login' do
		user_details = JSON.parse(request.body.read)
		user = User.find_by({username: user_details["username"]})
		if user && user.authenticate(user_details["password"])
			"ACCESS GRANTED."
		else
			"ACCESS DENIED." 
		end
	end
end

