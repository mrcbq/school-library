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
  # def to_hash
  #   {
  #     date: @date,
  #     person: @person,
  #     book: @book
  #   }
  # end
end
