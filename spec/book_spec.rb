require_relative '../book'

describe Book do
  describe '#initialize' do
    it 'creates a new book with valid attributes' do
      book = Book.new(title: 'Sample Book', author: 'John Doe')
      expect(book.title).to eq('Sample Book')
      expect(book.author).to eq('John Doe')
      expect(book.rentals).to eq([])
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the book' do
      book = Book.new(title: 'Sample Book', author: 'John Doe')
      expected_hash = { title: 'Sample Book', author: 'John Doe' }
      expect(book.to_hash).to eq(expected_hash)
    end
  end

  describe '.from_hash' do
    it 'creates a new book from a hash' do
      book_hash = { 'title' => 'Sample Book', 'author' => 'John Doe' }
      book = Book.from_hash(book_hash)
      expect(book.title).to eq('Sample Book')
      expect(book.author).to eq('John Doe')
      expect(book.rentals).to eq([])
    end
  end
end
