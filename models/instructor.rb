require_relative( '../db/sql_runner' )

class Instructor


  attr_accessor( :id, :name )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO instructors (name)
    VALUES( $1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM instructors"
    results = SqlRunner.run( sql )
    return results.map { |instructor| Instructor.new( instructor ) }
  end

  def self.delete_all()
    sql ="DELETE FROM instructors"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM instructors WHERE ID = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def classes
   sql = "SELECT * FROM classes WHERE instructor_id = $1"
   values = [@id]
   results = SqlRunner.run( sql )
   return results.map { |room| Class.new( room ) }
 end

end
