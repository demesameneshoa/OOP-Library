require_relative 'app'
# Main Method and App Entry Point
def main
  app = App.new
  app.home_page
end

def list_of_options
  puts
  puts 'Please select an option by entering a number:'
  puts '1. List all persons'
  puts '2. List all books'
  puts '3. List all rentals for a given person id'
  puts '4. Add a person'
  puts '5. Add a book'
  puts '6. Add a rental'
  puts '7. Exit'
  puts
end

def option(input)
  case input
  when 1
    list_all_persons
  when 2
    list_all_books
  when 3
    list_all_rentals
  when 4
    add_person
  when 5
    add_book
  when 6
    add_rentals
  else
    puts 'Invalid option. Please try again.'
  end
end
main