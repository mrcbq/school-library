require_relative '../rental'
require_relative '../book'
require_relative '../student'

RSpec.describe Rental do
  describe '#initialize' do
    it 'creates a new rental with valid attributes' do
      book = Book.new(title: 'Sample Book', author: 'John Doe')
      student = Student.new(id: 12345, classroom: 'Maths', name: 'Richard', age: 45)
      rental = Rental.new(book: book, person: student, date: '23/8/23')
      expect(rental.book.title).to eq('Sample Book')
      expect(rental.person.name).to eq('Richard')
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the rental' do
      book = Book.new(title: 'Sample Book', author: 'John Doe')
      student = Student.new(id: 12345, classroom: 'Maths', name: 'Richard', age: 45)
      rental = Rental.new(book: book, person: student, date: '23/8/23')
      expected_hash = {
        date: '23/8/23',
        book: {
          title: 'Sample Book',
          author: 'John Doe'
        },
        person: {
          id: 12345,
          class: "Student",
          name: 'Richard',
          age: 45,
          parent_permission: true,
          classroom: 'Maths'
        }
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end

  # describe '.from_hash' do
  #   it 'creates a new book from a hash' do
  #     book_hash = {
  #       'title' => 'Sample Book',
  #       'author' => 'John Doe'
  #     }
  #     book = Book.from_hash(book_hash)
  #     expect(book.title).to eq('Sample Book')
  #     expect(book.author).to eq('John Doe')
  #     expect(book.rentals).to eq([])
  #   end
  # end
end

