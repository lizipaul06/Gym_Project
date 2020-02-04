require_relative( '../db/sql_runner' )

class Instructor


  attr_accessor( :id, :name, :image, :qualifications )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @image = options['image']
    @qualifications = options['qualifications']
  end


  def save()
    sql = "INSERT INTO instructors (name, image, qualifications)
    VALUES( $1, $2, $3) RETURNING id"
    values = [@name, @image, @qualifications]
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
