require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(book:, person:, date:)
    @date = date
    @book = book
    @person = person
    
    person.add_rental(book, date)
    book.add_rental(person, date)
  end
end
