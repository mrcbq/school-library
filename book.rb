require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title:, author:)
    @title = title
    @author = author
    @rentals = []
  end

  def to_hash
    {
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_hash) # Serializa el atributo rentals como un array de hashes
    }
  end

  def self.from_hash(hash)
    book = Book.new(title: hash[:title], author: hash[:author])
    book.rentals = hash[:rentals]&.map { |rental_hash| Rental.from_hash(rental_hash) } || [] # Deserializa el atributo rentals desde los hashes
    book
  end
  # def add_rental(person, date)
  #   rental = Rental.new(book: self, person: person, date: date)
  #   @rentals << rental
  #   rental
  # end
end
