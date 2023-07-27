require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
    person.add_rental(self)
    book.add_rental(self)
  end
end
