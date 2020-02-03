require_relative( '../db/sql_runner' )

class Class_time

  attr_reader :id
  attr_accessor  :class_id, :date, :time, :capacity

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
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end
  def update()

  sql = "UPDATE class_times SET (class_id, date, time, capacity) = ($1, $2, $3, $4)
   WHERE id = $5"
   values = [@class_id, @date, @time, @capacity, @id]
     SqlRunner.run(sql, values)

end
  def self.all()
    sql = "SELECT * FROM class_times ORDER BY  date DESC, time, class_id ASC"
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
    sql = "SELECT * FROM bookings LEFT JOIN customers ON  bookings.customer_id = customers.id WHERE class_time_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    return results.map { |customer| Customer.new( customer ) }
  end


  def self.find(id)
    sql = "SELECT * FROM class_times WHERE id = $1"
    values = [id]
    class_time = SqlRunner.run(sql, values).first
    return Class_time.new(class_time)
  end

def activity
  sql = "SELECT activity FROM classes WHERE id = $1"
  values = [@class_id]
  gym = SqlRunner.run( sql, values ).first
  return gym["activity"]
end
end
