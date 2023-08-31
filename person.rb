require_relative 'decorator'
require_relative 'nameable'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
# Class for person
class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(name, age = 'Unknown', parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
