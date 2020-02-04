require_relative( '../db/sql_runner' )

class Booking

  attr_reader :id
  attr_accessor   :customer_id, :class_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @class_id = options['class_id'].to_i
    @class_time_id = options['class_time_id'].to_i
  end


  def save()
    sql = "INSERT INTO bookings (customer_id, class_id, class_time_id)
    VALUES( $1, $2, $3) RETURNING id"
    values = [@customer_id, @class_id, @class_time_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |booking| Booking.new( booking ) }
  end

  def self.delete_all()
    sql ="DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



    def self.find(id)
      sql = "SELECT * FROM bookings WHERE id = $1"
      values = [id]
      booking = SqlRunner.run(sql, values).first
      return Booking.new(booking)
    end

    def customer
      sql = "SELECT first_name, last_name FROM customers WHERE id = $1"
      values = [@customer_id]
      customer = SqlRunner.run( sql, values ).first
      return Customer.new(customer)
end

def class_time
  sql = "SELECT * FROM class_times WHERE id = $1"
  values = [@class_time_id]
  class_time = SqlRunner.run( sql, values ).first
  return Class_time.new(class_time)
end

end
