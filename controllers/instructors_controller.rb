require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/class_booking')
require_relative( '../models/gym.rb')
require_relative( '../models/instructor')
require_relative( '../models/class_time')
require_relative( '../models/customer')
also_reload( '../models/*' )


get '/instructors' do
  @instructors = Instructor.all
  erb (:"instructors/index")
end
