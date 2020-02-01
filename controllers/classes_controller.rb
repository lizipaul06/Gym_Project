require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/class_booking')
require_relative( '../models/gym.rb')
require_relative( '../models/instructor')
also_reload( '../models/*' )

get '/classes' do
  @gym_classes = Gym_class.all
  erb (:"classes/index")
end
