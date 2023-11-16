require './book'
require './student'
require './teacher'
require './rental'
require_relative 'info_loader'
require_relative 'savior'

# Represents the main application class for the app
class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = initialize_books
    @people = initialize_people
    @rentals = initialize_rentals
  end

  def list_all_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_number = gets.chomp.to_i
    case person_number
    when 1 then create_student
    when 2 then create_teacher
    else
      puts 'Not valid number'
    end
  end

  def create_student
    age = get_user_input('Age').to_i
    name = get_user_input('Name').capitalize
    classroom = get_user_input('Classroom').capitalize
    parent_permission = get_user_input_boolean('Has parent permission?')
    new_student = Student.new(classroom: classroom, age: age, parent_permission: parent_permission, name: name)
    @people << new_student
    puts 'Person created successfully'
  end

  def get_user_input(prompt)
    print "#{prompt}: "
    gets.chomp
  end

  def get_user_input_boolean(prompt)
    print "#{prompt} [Y/N]: "
    gets.chomp.upcase == 'Y'
  end

  def create_teacher
    print "Age: #{age = gets.chomp.to_i}"
    print "Name: #{name = gets.chomp.capitalize}"
    print "Specialization: #{specialization = gets.chomp.capitalize}"
    new_teacher = Teacher.new(specialization: specialization, age: age, name: name)
    @people << new_teacher
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    newbook = Book.new(title: title, author: author)
    @books << newbook
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_all_books
    number_book = gets.chomp.to_i
    book = @books[number_book]
    puts 'Select a person from the following list by number: '
    list_all_people
    number_person = gets.chomp.to_i
    person = @people[number_person]
    new_rental = Rental.new(book: book, person: person)
    @rentals << new_rental
  end

  def list_rentals_by_id
    print "Select one ID from the following people list: \n"
    list_all_people
    print 'enter the ID of person to search: '
    id_person = gets.chomp.to_i
    rentals_for_person = @rentals.select { |rental| rental.person.id == id_person }
    rentals_for_person.each do |rental|
      puts "Rented on Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author} \n"
    end
  end

  def exit
    save_books_to_file
    save_people_to_file
    save_rentals_to_file
    puts 'Data saved successfully! '
  end
end
