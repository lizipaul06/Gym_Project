require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/class_booking')
require_relative( '../models/gym.rb')
require_relative( '../models/instructor')
require_relative( '../models/class_time')
also_reload( '../models/*' )

get '/classes' do
  @class_times = Class_time.all
  erb (:"classes/index")
end

get '/classes/:id' do
    @class_time = Class_time.find(params['id'].to_i)
    erb (:"classes/show")
end
