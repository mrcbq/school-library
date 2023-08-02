require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(book:, person:, date:)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_hash
    {
      date: @date,
      book: @book.to_hash,
      person: @person.to_hash
    }
  end

  def self.from_hash(hash)
    date = hash["date"]
    book  = Book.new(title: hash["book"]["title"], author: hash["book"]["author"])
    person = Person.new(name: hash["person"]["name"], age: hash["person"]["age"], parent_permission: hash["person"]["parent_permission"])
    print book
    print person
    binding.pry
    rental = Rental.new(book: book, person: person, date: date)
    print rental
    # book.rentals = rental&.map { |rental_hash| self.from_hash(rental_hash) } || []
    book
  end
  # def to_hash
  #   {
  #     date: @date,
  #     person: @person,
  #     book: @book
  #   }
  # end
end
