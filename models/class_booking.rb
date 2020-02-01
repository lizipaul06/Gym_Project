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

end
