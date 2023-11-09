# teacher.rb
require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, options = {})
    super(options)
    @specialization = specialization
    self.name = options[:name]
    self.age = options[:age]
  end

  def can_use_service?
    true
  end
end
