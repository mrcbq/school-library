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
    }
  end

  def self.from_hash(hash)
    title = hash["title"]
    author  = hash["author"]
    rental = hash["rentals"]
    book = Book.new(title: title, author: author)
    book
  end
end
