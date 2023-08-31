require_relative 'person'

require_relative 'student'

require_relative 'teacher'

require_relative 'book'

require_relative 'rental'

require 'date'
require_relative 'classroom'
# create a new classroom
math_classroom = Classroom.new('Math')
# create new student
student1 = Student.new('James', 15, math_classroom)
# create a new book
book1 = Book.new('1984', 'George Orwell')
# create a person (teacher)
teacher1 = Teacher.new('Wilson', 45, 'Science', parent_permission: true)
# create a rental
rental1 = Rental.new(Date.today, book1, teacher1)
puts student1.classroom.label # Output: Math
puts math_classroom.students.first.name # Output: James
puts rental1.book.title # Output: 1984
puts rental1.person.name # Output: Wilson
