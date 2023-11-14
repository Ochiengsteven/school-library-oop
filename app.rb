require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'List of all people:'
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(role)
    puts "Creating a new #{role}..."
    puts 'Enter name:'
    name = gets.chomp
    puts 'Enter age:'
    age = gets.chomp.to_i
  
    case role
    when 'student'
      if age < 18
        puts 'Does the student have parent permission? (yes/no):'
        permission_input = gets.chomp.downcase
        parent_permission = permission_input == 'yes'
      else
        parent_permission = true
      end
  
      person = Student.new(age, name, parent_permission: parent_permission)
    when 'teacher'
      puts 'Enter specialization:'
      specialization = gets.chomp
      person = Teacher.new(specialization, name: name, age: age)
    end
  
    @people << person
  end

  def create_book
    puts 'Creating a new book...'
    puts 'Enter Author:'
    title = gets.chomp
    puts 'Enter Title:'
    author = gets.chomp
    book = Book.new(author, title)
    @books << book
  end

  def create_rental
    puts 'Creating a new rental...'

    puts 'Select the book from the following list by number:'
    @books.each_with_index { |book, index| puts "#{index + 1}. Title: #{book.title}, Author #{book.author}" }
    book_number = gets.chomp.to_i

    if book_number < 1 || book_number > @books.length
      puts 'Invalid book number!'
      return
    end

    selected_book = @books[book_number - 1]

    puts 'Select a person from the following list by number:'
    @people.each_with_index do |person, index|
      role = person.is_a?(Student) ? '[student]' : '[teacher]'
      puts "#{index + 1}. #{role} #{person.name}, Age: #{person.age}"
    end

    person_number = gets.chomp.to_i

    if person_number < 1 || person_number > @people.length
      puts 'Invalid person number!'
      return
    end

    selected_person = @people[person_number - 1]

    puts 'Enter date (YYYY-MM-DD):'
    date = gets.chomp

    @rentals << Rental.new(date, selected_person, selected_book)

    puts 'Rental created successfully!'
  end

  def list_all_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id.to_s }

    if person.nil?
      puts 'Person not found!'
    else
      puts "Rentals for #{person.name}:"
      rentals = @rentals.select { |rental| rental.person.id == person.id }

      if rentals.empty?
        puts "No rentals found for #{person.name}."
      else
        rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title}"
        end
      end
    end
  end

  def role_from_user
    loop do
      puts 'Enter the role (student/teacher):'
      role = gets.chomp.downcase
      return role if %w[student teacher].include?(role)

      puts 'Invalid role. Please enter student or teacher.'
    end
  end

  def get_person_id
    loop do
      puts 'Enter the person ID:'
      person_id = gets.chomp
  
      return person_id if @people.any? { |p| p.id == person_id }
  
      puts 'Person not found. Please enter a valid ID.'
    end
  end
end
