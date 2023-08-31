require_relative 'person'
# Class representing a student
class Student < Person
  attr_accessor :classroom

  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
