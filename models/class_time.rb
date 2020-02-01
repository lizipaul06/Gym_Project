require_relative( '../db/sql_runner' )

class Class_time

  attr_reader :id
  attr_accessor  :class_id, :date, :time

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @class_id = options['class_id'].to_i
    @date = options['date']
    @time = options['time']
    @capacity = options['capacity']
  end


  def save()
    sql = "INSERT INTO class_times (class_id, date, time, capacity)
    VALUES( $1, $2, $3, $4) RETURNING id"
    values = [@class_id, @date, @time, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM class_times"
    results = SqlRunner.run( sql )
    return results.map { |time| Class_time.new( time ) }
  end

  def self.delete_all()
    sql ="DELETE FROM class_times"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM class_times WHERE ID = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers
    sql = "SELECT * FROM customers INNER JOIN bookings ON customers.id = bookings.customer_id WHERE class_time_id = $1"
    values = [@id]
    results = SqlRunner.run( sql )
    return results.map { |customer| Customer.new( customer ) }
  end

end
