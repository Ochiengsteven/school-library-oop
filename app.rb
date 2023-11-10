require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @people = [] # Array to store people (students/teachers)
    @books = [] # Array to store books
    @rentals = [] # Array to store rentals
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
    puts 'Enter person ID:'
    person_id = gets.chomp
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found!'
      return
    end

    puts 'Enter book title:'
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    if book.nil?
      puts 'Book not found!'
      return
    end

    puts 'Enter date (YYYY-MM-DD):'
    date = gets.chomp

    @rentals << Rental.new(date, person, book)
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

  def main
    loop do
      puts 'Welcome to the Library App!'
      puts 'Choose an option:'
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person ID'
      puts '7. Quit'

      choice = gets.chomp.to_i

      case choice
      when 1
        list_all_books
      when 2
        list_all_people
      when 3
        role = role_from_user
        create_person(role)
      when 4
        create_book
      when 5
        create_rental
      when 6
        puts 'Enter the person ID:'
        person_id = gets.chomp.to_i
        list_all_rentals_for_person(person_id)
      when 7
        break
      else
        puts 'Invalid option. Please try again.'
      end
    end
  end

  private

  def role_from_user
    loop do
      puts 'Enter the role (student/teacher):'
      role = gets.chomp.downcase
      return role if %w[student teacher].include?(role)

      puts 'Invalid role. Please enter student or teacher.'
    end
  end
end

app = App.new
app.main
