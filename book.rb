require_relative 'rental'

class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, person, self)
    @rentals << rental
    person.add_rental(rental)
  end
end
