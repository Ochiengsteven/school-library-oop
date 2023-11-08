require 'securerandom'

class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @id = SecureRandom.uuid
    @parent_permission = parent_permission
  end

  def can_use_service
    of_age || parent_permission
  end

  private

  def of_age
    age >= 18
  end
end

student1 = Person.new(20, 'Steve', parent_permission: false)
puts student1.can_use_service
