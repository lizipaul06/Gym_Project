require_relative( '../db/sql_runner' )

class Gym_class

  attr_reader :id
  attr_accessor  :activity, :instructor_id, :type, :intensity, :status

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @actiivty = options['activity']
    @instructor_id = options['instructor_id'].to_i
    @type = options['type']
    @intensity = options['intensity']
    @status = options['status']

  end


  def save()
    sql = "INSERT INTO classes (activity, instructor_id, type, intensity, status)
    VALUES( $1, $2, $3, $4, $5) RETURNING id"
    values = [@activity, @instructor_id, @type, @intensity, @status]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM classes"
    results = SqlRunner.run( sql )
    return results.map { |customer| Gym_class.new( customer ) }
  end

  def self.delete_all()
    sql ="DELETE FROM classes"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM classes WHERE ID = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
  sql = "UPDATE classes SET (activity, instructor_id, type, intensity, status) = ($1, $2, $3, $4, $5)
   WHERE id = $6"
   values = [@activity, @instructor_id, @type, @capacity, @intensity, @status]
  result = SqlRunner.run(sql, values)
end

def times
  sql = "SELECT * FROM class_times WHERE class_id = $1 ORDER BY class_times.time ASC"
  values = [@id]
  results = SqlRunner.run( sql, values)
  return results.map { |time| Class_time.new(time) }
end

def instructor
  sql = "SELECT * FROM instructors WHERE id = $1"
  values = [@instructor_id]
  name = SqlRunner.run( sql, values)[0]
  return Instructor.new(name)
end

end
