# frozen_string_literal: true

require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

def initialize_people
  serialized_people = JSON.parse(File.read('people.json'))
  @people = serialized_people.map do |person_hash|
    person_class = person_hash['class']
    case person_class
    when 'Student' then create_student_from_hash(person_hash)
    when 'Teacher' then create_teacher_from_hash(person_hash)
    end
  end
end

def create_student_from_hash(person_hash)
  Student.new(
    id: person_hash['id'],
    name: person_hash['name'],
    age: person_hash['age'],
    parent_permission: person_hash['parent_permission'],
    classroom: person_hash['classroom']
  )
end

def create_teacher_from_hash(person_hash)
  Teacher.new(
    id: person_hash['id'],
    name: person_hash['name'],
    age: person_hash['age'],
    specialization: person_hash['specialization']
  )
end

def initialize_books
  serialized_books = begin
    JSON.parse(File.read('books.json'))
  rescue StandardError
    []
  end
  books = []
  serialized_books.each do |book_hash|
    books.push(Book.from_hash(book_hash))
  end
  books
end

def initialize_rentals
  serialized_rentals = begin
    JSON.parse(File.read('rentals.json'))
  rescue StandardError
    []
  end
  rentals = []
  serialized_rentals.each do |rental_hash|
    rentals.push(Rental.from_hash(rental_hash))
  end
  rentals
end
