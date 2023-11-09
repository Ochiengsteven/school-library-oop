require_relative 'person'
require_relative 'nameable'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'teacher'

student1 = Student.new(21, 'Jack')

book_sinking = Book.new('Sinking', 'Jaba')
book_river = Book.new('The River and The Source', 'Ngugi')

rental1 = Rental.new('2023-12-22', student1, book_sinking)
rental2 = Rental.new('2023-10-18', student1, book_river)

puts "Title of book in rental 1: #{rental1.book.title}"
puts "Title of book in rental 2: #{rental2.book.title}"

puts "Number of rentals for #{student1.name}: #{student1.rentals.count}"
puts "Dates of rentals for #{student1.name}: #{student1.rentals.map(&:date)}"
puts "Names of people in rentals: #{student1.rentals.map { |rental| rental.person.name }}"
