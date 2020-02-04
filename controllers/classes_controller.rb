require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/class_booking')
require_relative( '../models/gym.rb')
require_relative( '../models/instructor')
require_relative( '../models/class_time')
also_reload( '../models/*' )


get '/classes/:id/update' do

  @gym_class = Gym_class.find( params[:id] )
@instructors = Instructor.all
  erb(:"classes/update")
end
post '/classes/:id' do

  @gym_class = Gym_class.new(params)
   @gym_class.update()

redirect '/classes'

end
post  '/classes/:id/delete' do
@gym_class = Gym_class.find(params['id'].to_i)
 @gym_class.deleteclass()

redirect '/classes'
end

get '/classes/new' do
  @gym_classes = Gym_class.all
    @instructors = Instructor.all
 erb(:"classes/new")
end

post '/classes' do
  @gym_class = Gym_class.new(params)
   @gym_class.save()

  redirect 'classes'
end

get '/classes' do
   @gym_classes = Gym_class.all
   erb (:"classes/index")
end
