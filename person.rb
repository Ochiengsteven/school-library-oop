# require 'securerandom'
require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :nameable
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true, nameable: nil)
    super()
    @name = name
    @age = age
    @id = name # SecureRandom.uuid
    @parent_permission = parent_permission
    @nameable = nameable
    @rentals = []
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

  def add_rental(rental)
    @rentals << rental
  end
end
