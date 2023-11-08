class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permision: true)
    @name = name
    @age = age
    @id = id
    @parent_permision = parent_permision
  end
end
