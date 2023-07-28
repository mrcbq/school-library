require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title:, author:)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(book: self, person: person, date: date)
    @rentals << rental
    rental
  end
end
