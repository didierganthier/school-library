require './book'
require './rental'
require './person'

describe Book do
  describe '#title' do
    it 'returns the correct title' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      expect(book.title).to eq('The Great Gatsby')
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end
  end

  describe '#rentals' do
    it 'returns an empty array' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      expect(book.rentals).to eq([])
    end
  end
end
