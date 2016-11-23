require('pg')
require_relative('../db/sql_runner')

class Student

  attr_accessor :first_name, :second_name, :house
  attr_reader :id

  def initialize(options)
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @id = options['id'].to_i if options['id']
  end

  def name()
    @name = "#{@first_name} " + "#{@second_name}"
  end

  def save()
    sql = "INSERT INTO students (first_name, second_name, house) VALUES ('#{@first_name}', '#{@second_name}', '#{@house}') returning *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = #{id}"
    result = SqlRunner.run(sql)
    return result.map {|student| Student.new(student)}
  end

  def self.all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    return result.map {|student| Student.new(student)}
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end


end