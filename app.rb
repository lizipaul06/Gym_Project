require( 'sinatra' )
require('sinatra/contrib/all')
require_relative('controllers/classes_controller')
require_relative('controllers/customers_controller')
require_relative('controllers/class_time_controller')

get '/' do

  erb (:index)
end
