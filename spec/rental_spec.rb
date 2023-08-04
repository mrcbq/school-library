require_relative '../rental'
require_relative '../book'
require_relative '../student'
require 'pry'

RSpec.describe Rental do
  describe '#initialize' do
    it 'creates a new rental with valid attributes' do
      book = Book.new(title: 'Sample Book', author: 'John Doe')
      student = Student.new(id: 12_345, classroom: 'Maths', name: 'Richard', age: 45)
      rental = Rental.new(book: book, person: student, date: '23/8/23')
      expect(rental.book.title).to eq('Sample Book')
      expect(rental.person.name).to eq('Richard')
    end
  end
end

RSpec.describe Rental do
  describe '#to_hash' do
    it 'returns a hash representation of the rental' do
      book = Book.new(title: 'Sample Book', author: 'John Doe')
      student = Student.new(id: 12_345, classroom: 'Maths', name: 'Richard', age: 45)
      rental = Rental.new(book: book, person: student, date: '23/8/23')
      expected_hash = {
        date: '23/8/23',
        book: {
          title: 'Sample Book',
          author: 'John Doe'
        },
        person: {
          id: 12_345,
          class: 'Student',
          name: 'Richard',
          age: 45,
          parent_permission: true,
          classroom: 'Maths'
        }
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end
end

RSpec.describe Rental do
  describe '.from_hash' do
    it 'creates a new rental from a hash' do
      rental_hash = {
        'date' => '23/8/23',
        'book' => {
          'title' => 'Sample Book',
          'author' => 'John Doe'
        },
        'person' => {
          'id' => 12_345,
          'name' => 'Richard',
          'age' => 45,
          'parent_permission' => true
        }
      }
      rental = Rental.from_hash(rental_hash)
      expect(rental.date).to eq('23/8/23')
      expect(rental.book.title).to eq('Sample Book')
      expect(rental.person.name).to eq('Richard')
    end
  end
end
