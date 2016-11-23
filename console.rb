require('pry-byebug')
require_relative('models/student')

Student.delete_all()

student1 = Student.new({
  'first_name' => 'Hermione',
  'second_name' => 'Granger',
  'house' => 'Gryffindor'
})

student2 = Student.new({
  'first_name' => 'Luna',
  'second_name' => 'Lovegood',
  'house' => 'Ravenclaw'
})

student3 = Student.new({
  'first_name' => 'Cedric',
  'second_name' => 'Diggory',
  'house' => 'Hufflepuff'
})

student4 = Student.new({
  'first_name' => 'Draco',
  'second_name' => 'Malfoy',
  'house' => 'Slytherin'
})

student1.save()
student2.save()
student3.save()
student4.save()

Student.find(student1.id)

students = Student.all()






binding.pry
nil