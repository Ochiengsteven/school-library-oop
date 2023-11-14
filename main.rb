require_relative 'app'

def display_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def perform_option(app, response)
  case response
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    role = app.role_from_user
    app.create_person(role)
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    person_id = app.get_person_id
    app.list_all_rentals_for_person(person_id)
  when '7'
    puts 'Thank you for using this app!'
  else
    puts 'Invalid option. Please try again.'
  end
end

def main
  app = App.new
  response = nil

  puts 'Welcome to School Library App!'
  until response == '7'
    display_options
    response = gets.chomp
    perform_option(app, response)
    puts "\n"
  end
end

main
