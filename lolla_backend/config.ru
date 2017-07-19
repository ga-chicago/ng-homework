require './app'
require './models/SetModel'
require './controllers/SetController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'shows'
)

map('/sets'){run SetController}
