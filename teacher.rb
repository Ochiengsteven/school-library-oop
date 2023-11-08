require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, name = 'Unknown')
    super(age, name, parent_permission)
    self.name = name
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
