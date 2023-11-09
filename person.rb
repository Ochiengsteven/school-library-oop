require 'securerandom'
require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :nameable
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true, nameable: nil)
    super()
    @name = name
    @age = age
    @id = SecureRandom.uuid
    @parent_permission = parent_permission
    @nameable = nameable
  end

  def can_use_service?
    of_age? || parent_permission
  end

  def correct_name
    name
  end

  private

  def of_age?
    age >= 18
  end
end
