require_relative 'book'
require_relative 'person'
require_relative 'rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index + 1}. Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(type, name, age, parent_permission: true, specialization: nil)
    person = nil
    if type == 'student'
      person = Student.new(name, age, parent_permission: parent_permission)
    elsif type == 'teacher'
      person = Teacher.new(name, age, specialization)
    end
    @people << person if person
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(book_id, person_id, date)
    book = @books[book_id - 1]
    person = @people[person_id - 1]
    rental = Rental.new(book, person, date)
    @rentals << rental
  end

  def list_rentals_for_person(person_id)
    person = @people[person_id - 1]
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each_with_index do |rental, index|
      puts "#{index + 1}. Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end
end
