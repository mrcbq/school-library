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
      # rentals: @rentals.map(&:to_hash)
    }
  end

  def self.from_hash(hash)
    title = hash["title"]
    author  = hash["author"]
    rental = hash["rentals"]
    book = Book.new(title: title, author: author)
    # book.rentals = rental&.map { |rental_hash| self.from_hash(rental_hash) } || []
    book
  end
end
