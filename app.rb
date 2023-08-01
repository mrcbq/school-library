require './book'
require './student'
require './teacher'
require './rental'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = initialize_books
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      puts
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      puts
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_number = gets.chomp.to_i
    case person_number
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Not valid number'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Classroom: '
    classroom = gets.chomp.capitalize
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'
    new_student = Student.new(classroom: classroom, age: age, parent_permission: parent_permission, name: name)
    @people << new_student
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    new_teacher = Teacher.new(specialization: specialization, age: age, name: name)
    @people << new_teacher
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    puts title, author
    newbook = Book.new(title: title, author: author)
    @books << newbook
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_all_books
    number_book = gets.chomp.to_i
    book = @books[number_book]
    puts
    puts 'Select a person from the following list by number: '
    list_all_people
    number_person = gets.chomp.to_i
    person = @people[number_person]
    puts
    print 'Date: '
    date = gets.chomp.to_s
    new_rental = Rental.new(date: date, book: book, person: person)
    @rentals << new_rental
    print 'Rental created successfully'
  end

  def list_rentals_by_id
    print 'ID of person: '
    id_person = gets.chomp.to_i
    person_to_find = @people.find { |person| person.id == id_person }
    puts 'Rentals: '
    person_to_find.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
    puts
  end

  def exit
    puts 'Thanks for using the school library App!'
    p @books
    save_books_to_file
  end

  def save_books_to_file
    File.open('books.json', 'w') do |file|
      serialized_books = @books.map(&:to_hash)
      file.puts JSON.dump(serialized_books)
    end
  end

  def initialize_books
    # p @books
    serialized_books = JSON.parse(File.read('books.json')) rescue []
    books = []
    # p serialized_books.class
    serialized_books.each do |book_hash| 
      books.push(Book.from_hash(book_hash))
    end
    # p books
    books
  end  
end
