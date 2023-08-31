require_relative 'app'
# Main Method and App Entry Point
def main
  app = App.new
  app.home_page
end

def list_of_options
  puts
  puts 'Please select an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a Rental'
  puts '6. List all rentals for a given id'
  puts '7. Exit'
  puts
end

def option(input)
  case input
  when 1
    list_all_books
  when 2
    list_all_persons
  when 3
    add_person
  when 4
    add_book
  when 5
    add_rentals
  when 6
    list_all_rentals
  else
    puts 'Invalid Input'
  end
end
main
