require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(book:, person:, date: nil)
    @date = date || Time.now
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
    person = Person.new(id: hash["person"]["id"], name: hash["person"]["name"], age: hash["person"]["age"], parent_permission: hash["person"]["parent_permission"])
    rental = Rental.new(date: date, book: book, person: person)
    rental
  end
end
