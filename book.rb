# frozen_string_literal: true

require_relative 'rental'

# Represents a book in the library.
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
      author: @author
    }
  end

  def self.from_hash(hash)
    title = hash['title']
    author = hash['author']
    hash['rentals']
    Book.new(title: title, author: author)
  end
end
