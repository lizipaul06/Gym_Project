require( 'sinatra' )
require('sinatra/contrib/all')
require_relative('controllers/classes_controller')
require_relative('controllers/customers_controller')
require_relative('controllers/class_times_controller')
require_relative('controllers/instructors_controller')
also_reload('./models/*')

get '/' do

  erb (:index)
end
