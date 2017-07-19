class Restaurant < ActiveRecord::Base
	self.table_name = 'restaurants'
	has_many :reservations, class_name: 'Reservation'
	has_many :menus, through: :reservations
end