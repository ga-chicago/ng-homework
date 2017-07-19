class Menu < ActiveRecord::Base
	self.table_name = 'menu'
	has_many :reservations, class_name: 'Reservation'
	has_many :menus, through: :reservations
end