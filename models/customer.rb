require_relative( '../db/sql_runner' )

class Customer


  attr_accessor( :id, :first_name,:last_name, :membership, :status )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership = options['membership']
    @status = options['status']
  end


  def save()
    sql = "INSERT INTO customers (first_name, last_name, membership, status)
    VALUES( $1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @membership, @status]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end


  def pretty_name()
  return "#{@first_name} #{@last_name}"
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
  sql = "UPDATE customers SET (first_name, last_name, membership, status) = ($1, $2, $3, $4)
   WHERE id = $5"
   values = [@first_name,@last_name, @membership, @status, @id]
     SqlRunner.run(sql, values)

end

def self.find(id)
  sql = "SELECT * FROM customers WHERE id = $1"
  values = [id]
  customer = SqlRunner.run(sql, values).first
  return Customer.new(customer)
end





end
