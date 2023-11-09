require_relative 'person'
require_relative 'nameable'
require_relative 'classroom'
require_relative 'student'

student1 = Student.new(21, 'Jack')
student3 = Student.new(16, 'Mary')

class1 = Classroom.new('Math')
class1.students

student1.classroom
class1.add_student(student1)
student1.classroom
student1.classroom.label
class1.students

student3.classroom
class1.add_student(student3)
student3.classroom
student3.classroom.label
class1.students

puts class1.students.count
puts class1.students.first.name
puts class1.students.last.age
