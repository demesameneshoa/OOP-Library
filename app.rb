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
    until list_of_options
      input = gets.chomp.to_i
      if input == 7
        puts 'Thank you!'
        exit
      end
      option input
    end
  end

  def list_all_persons
    puts 'People List is empty.' if @persons.empty?
    @persons.each do |person|
      puts "Name: #{person.name}, Age: #{person.age} ID: #{person.id}"
    end
  end

  def list_all_books
    puts 'Books List is empty.' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def add_person
    print 'Do you want to create a student (1) or a teacher (2) ? [Input The Number]: '
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
    print 'Age : '
    age = gets.chomp.to_i
    print 'Name : '
    name = gets.chomp
    print 'Has parent permission? [Y/N] : '
    parent_permission = gets.chomp.downcase
    print 'Classroom : '
    classroom_lable = gets.chomp
    classroom = Classroom.new(classroom_lable)
    case parent_permission
    when 'y'
      student = Student.new(name, age, classroom, parent_permission: true)
      @persons << student
    when 'n'
      student = Student.new(name, age, classroom, parent_permission: false)
      @persons << student
    end
    puts 'Student addeed successfully'
  end

  def add_teacher
    puts 'Creating a teacher'
    print 'Age : '
    age = gets.chomp.to_i
    print 'Name : '
    name = gets.chomp
    print 'Specialization : '
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @persons << teacher
    puts 'Teacher addeed successfully'
  end

  def add_book
    puts 'Creating a book'
    print 'Title : '
    title = gets.chomp
    print 'Author : '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book addeed successfully'
  end

  def add_rentals
    puts 'Select which book you want to rent by its Number '
    @books.each_with_index { |book, index| puts "Number: #{index}. Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i
    puts 'Select which person will rent the book by its Number '
    @persons.each_with_index { |person, index| puts "Number: #{index}. Name: #{person.name}, Age: #{person.age}" }
    person_id = gets.chomp.to_i
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp.to_s
    rental = Rental.new(date, @books[book_id], @persons[person_id])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'List is empty. Please add a rental' if @rentals.empty?
    puts 'ID of the person:'
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
