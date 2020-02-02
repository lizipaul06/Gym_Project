require_relative( "../models/class_booking.rb" )
require_relative( "../models/class_time.rb" )
require_relative( "../models/gym.rb" )
require_relative( "../models/instructor.rb" )
require_relative( "../models/customer.rb" )
require('pry')


Booking.delete_all()
Class_time.delete_all()
Gym_class.delete_all()
Instructor.delete_all()
Customer.delete_all()

customer1 = Customer.new({'first_name' => 'Margret','last_name' => 'Jones', 'membership' => 'off-peak', 'status' => 'active'})
customer2 = Customer.new({'first_name' => 'James','last_name' => 'Davis', 'membership' => 'peak', 'status' => 'active'})
customer3 = Customer.new({'first_name' => 'Tom','last_name' => 'Wiliiams', 'membership' => 'off-peak', 'status' => 'deactive'})
customer4 = Customer.new({'first_name' => 'James','last_name' => 'Kimpling', 'membership' => 'peak', 'status' => 'active'})
customer5 = Customer.new({'first_name' => 'Will', 'last_name' => 'Smith','membership' => 'off-peak', 'status' => 'deactive'})

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save

instructor1 = Instructor.new({'name' => 'Millie'})
instructor2 = Instructor.new({'name' => 'Adam'})
instructor3 = Instructor.new({'name' => 'John'})

instructor1.save
instructor2.save
instructor3.save


class1 = Gym_class.new({'activity' => 'HIT to the MAX ', 'instructor_id' => 1, 'type' => 'peak', 'intensity' =>  'High impact', 'status' => 'active'})
class2 = Gym_class.new({'activity' => 'Yoga ', 'instructor_id' => 3, 'type' => 'off-peak', 'intensity' =>  'Low impact', 'status' => 'active'})
class3 = Gym_class.new({'activity' => 'Spin', 'instructor_id' => 1, 'type' => 'peak', 'intensity' =>  'High impact', 'status' => 'deactive'})

class1.save
class2.save
class3.save

class_time1 = Class_time.new({'class_id' => 1, 'date' => 'Friday', 'time' => '09:00','capacity' => 5})
class_time2 = Class_time.new({'class_id' => 1, 'date' => 'Wednesday', 'time' => '12:00','capacity' => 10})
class_time3 = Class_time.new({'class_id' => 1, 'date' => 'Monday', 'time' => '10:00','capacity' => 5})
class_time4 = Class_time.new({'class_id' => 2, 'date' => 'Friday', 'time' => '11:00','capacity' => 5})
class_time5 = Class_time.new({'class_id' => 2, 'date' => 'Wednesday', 'time' => '09:00','capacity' => 5})
class_time6 = Class_time.new({'class_id' => 2, 'date' => 'Monday', 'time' => '16:00','capacity' => 15})
class_time7 = Class_time.new({'class_id' => 3, 'date' => 'Friday', 'time' => '16:00','capacity' => 15})
class_time8 = Class_time.new({'class_id' => 3, 'date' => 'Wednesday', 'time' => '16:00','capacity' => 5})
class_time9 = Class_time.new({'class_id' => 3, 'date' => 'Monday', 'time' => '13:00','capacity' => 10})
class_time1.save
class_time2.save
class_time3.save
class_time4.save
class_time5.save
class_time6.save
class_time7.save
class_time8.save
class_time9.save

booking1 = Booking.new({'customer_id' => 1, 'class_id' => 3, 'class_time_id' => 1})
booking2 = Booking.new({'customer_id' => 2, 'class_id' => 2, 'class_time_id' => 1})
booking3 = Booking.new({'customer_id' => 1, 'class_id' => 3, 'class_time_id' => 2})
booking4 = Booking.new({'customer_id' => 3, 'class_id' => 1, 'class_time_id' => 2})
booking5 = Booking.new({'customer_id' => 2, 'class_id' => 1, 'class_time_id' => 3})


booking1.save
booking2.save
booking3.save
booking4.save
booking5.save

binding.pry
nil
