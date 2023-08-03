# frozen_string_literal: true

require_relative 'book'
require_relative 'person'
require_relative 'rental'
require 'json'

def save_books_to_file
  File.open('books.json', 'w') do |file|
    serialized_books = @books.map(&:to_hash)
    file.puts JSON.dump(serialized_books)
  end
end

def save_people_to_file
  serialized_people = @people.map(&:to_hash)
  File.open('people.json', 'w') do |file|
    file.puts JSON.dump(serialized_people)
  end
end

def save_rentals_to_file
  serialized_rentals = []
  File.open('rentals.json', 'w') do |file|
    @rentals.each do |rental|
      rental_serialized = { date: rental.date, book: rental.book.to_hash, person: rental.person.to_hash }
      serialized_rentals.push(rental_serialized)
    end
    file.puts JSON.dump(serialized_rentals)
  end
end
