require_relative 'person'

# Class representing a teacher

class Teacher < Person
  def initialize(_name, age, specialization, parent_permission: true)
    super(age, age, parent_permission: parent_permission)

    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
