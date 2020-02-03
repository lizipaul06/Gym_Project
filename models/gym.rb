require_relative( '../db/sql_runner' )

class Gym_class

  attr_reader :id
  attr_accessor  :activity, :instructor_id, :type, :intensity, :status

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @activity = options['activity']
    @instructor_id = options['instructor_id'].to_i
    @type = options['type']
    @intensity = options['intensity']
    @status = options['status']

  end


  def save()
    sql = "INSERT INTO classes (activity, instructor_id, type, intensity, status)
    VALUES( $1, $2, $3, $4, $5) RETURNING id"
    values = [@activity, @instructor_id, @type, @intensity, @status]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
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
   values = [@activity, @instructor_id, @type, @intensity, @status, @id]
  result = SqlRunner.run(sql, values)
end

def times
  sql = "SELECT * FROM class_times WHERE id = $1"
  values = [@class_id]
  gym = SqlRunner.run(sql, values).first
  return Class_time.new(gym)
end

def self.find(id)
  sql = "SELECT * FROM classes WHERE id = $1"
  values = [id]
  gym = SqlRunner.run(sql, values).first
  return Gym_class.new(gym)
end

def instructor
  sql = "SELECT * FROM instructors WHERE id = $1"
  values = [@instructor_id]
  instructor = SqlRunner.run(sql, values).first
  return Instructor.new(instructor)
end

end
