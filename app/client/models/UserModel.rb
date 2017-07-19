class User < ActiveRecord::Base
	self.table_name = 'users';
	has_secure_password

	# def password=(password)
	# 	@password_digest = Bcrypt.crypt(password)
	# end

	# def authenticate(password)
	# 	if Bcrypt.crypt(password) === @password_digest
	# 		true
	# 	else
	# 		false
	# 	end
	# end
end