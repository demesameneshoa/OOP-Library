require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
# App class
class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def home_page
    puts 'Welcome to Library App!'
    until list_of_options
      input = gets.chomp.to_i
      if input == 7
        puts 'Thank you for using Library App!'
        exit
      end

      option input
    end
  end

  def list_all_persons
    puts 'Person List is empty. Please add a person first.' if @persons.empty?
    @persons.each do |person|
      puts "Name: #{person.name}, Age: #{person.age}"
    end
  end

  def list_all_books
    puts 'Book List is empty. Please add a book first.' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def add_person
    puts 'Do you want to create ?'
    puts '1. Student'
    puts '2. Teacher'
    input = gets.chomp.to_i
    if input == 1
      add_student
    elsif input == 2
      add_teacher
    else
      puts 'Invalid option. Please try again'
    end
  end

  def add_student
    puts 'Creating a student'
    puts 'Name : '
    name = gets.chomp
    puts 'Age : '
    age = gets.chomp.to_i
    puts 'Has parent permission? [Y/N] : '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @persons << student
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      @persons << student
    else
      puts 'Invalid option. Please try again.'
      add_student
    end
  end

  def add_teacher
    puts 'Creating a teacher'
    puts 'Age : '
    age = gets.chomp.to_i
    puts 'Name : '
    name = gets.chomp
    puts 'Specialization : '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @persons << teacher
    puts "Teacher created successfully with ID #{teacher.id}"
  end

  def add_book
    puts 'Creating a book'
    puts 'Title : '
    title = gets.chomp
    puts 'Author : '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully"
  end

  def add_rentals
    puts 'Select which book you want to rent by its ID '
    @books.each_with_index { |book, index| puts "#{index}. Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select which person will rent the book by its ID '
    @persons.each_with_index { |person, index| puts "#{index}. Name: #{person.name}, Age: #{person.age}" }

    person_id = gets.chomp.to_i

    puts 'Date : '
    date = gets.chomp.to_s

    rental = Rental.new(date, @persons[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'List is empty. Please add a rental' if @rentals.empty?
    puts 'Enter the ID of the rental you want to see'
    @persons.each { |person| puts "ID: #{person.id}, Name: #{person.name}" }

    id = gets.chomp.to_i
    puts 'Rented books:'
    @rentals.each do |rental|
      if rental.person.id == id
        print "Person: #{rental.person.name} Date: #{rental.date} "
        puts "Book: #{rental.book.title}, Author: #{rental.book.author}"
      else
        puts 'No rentals found'
      end
    end
  end
end
