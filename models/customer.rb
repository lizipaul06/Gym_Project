require_relative( '../db/sql_runner' )

class Customer


  attr_reader( :id, :name, :funds, :membership, :status )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @membership = options['membership']
    @status = options['status']
  end


  def save()
    sql = "INSERT INTO customers (name, membership, status)
    VALUES( $1, $2, $3) RETURNING id"
    values = [@name, @membership, @status]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run( sql )
    return results.map { |customer| Customer.new( customer ) }
  end

  def self.delete_all()
    sql ="DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE ID = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
  sql = "UPDATE customers SET (name, membership, status) = ($1, $2, $3)
   WHERE id = $4"
   values = [@name, @membership, @status]
  result = SqlRunner.run(sql, values)
end

def book_class(class1, class_time)
  return nil if class_time.capacity <= 1
  class_time.capacity -= 1
  newbooking = Booking.new({'customer_id' => @id, 'class_id' => class1.id, 'class_time_id' => class_time.id})
  newbooking.save
  return newbooking
end


end
