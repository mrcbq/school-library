require './book'
require './student'
require './teacher'
require './rental'
require 'json'
require 'pry'

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
    print 'Select one ID from the following people list'
    list_all_people
    print 'enter the ID of person to search: '
    id_person = gets.chomp.to_i

    rentals_for_person = @rentals.select { |rental| rental.person.id == id_person }

    if rentals_for_person.empty?
      puts 'No rentals found for the person with the given ID'
    else
      puts 'Rentals: '
      rentals_for_person.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

  puts
  end

  def exit
    save_books_to_file
    save_people_to_file
    save_rentals_to_file
  end

  def save_books_to_file
    File.open('books.json', 'w') do |file|
      serialized_books = @books.map(&:to_hash)
      file.puts JSON.dump(serialized_books)
    end
  end

  def initialize_books
    serialized_books = JSON.parse(File.read('books.json')) rescue []
    books = []
    serialized_books.each do |book_hash| 
      books.push(Book.from_hash(book_hash))
    end
    books
  end  

  def save_people_to_file 
    serialized_people = @people.map(&:to_hash)
    File.open('people.json', 'w') do |file|
      file.puts JSON.dump(serialized_people)
    end
  end

  def initialize_people
    serialized_people = JSON.parse(File.read('people.json')) rescue []
    people = []
    serialized_people.each do |person_hash| 
      if person_hash['class'] == 'Student'
        people.push(Student.from_hash(person_hash))
      elsif person_hash['class'] == 'Teacher'
        people.push(Teacher.from_hash(person_hash))
      end
    end
    @people = people
  end

  def save_rentals_to_file
    serialized_rentals = []
    File.open('rentals.json', 'w') do |file|
      @rentals.each do |rental|
        rental_serialized = 
          {
            date: Time.now,
            book: rental.book.to_hash,
            person: rental.person.to_hash
          }
          serialized_rentals.push(rental_serialized)
      end
      file.puts JSON.dump(serialized_rentals)
    end
  end

  def initialize_rentals
    serialized_rentals = JSON.parse(File.read('rentals.json')) rescue []
    rentals = []
    serialized_rentals.each do |rental_hash| 
      rentals.push(Rental.from_hash(rental_hash))
    end
    rentals
  end
end
