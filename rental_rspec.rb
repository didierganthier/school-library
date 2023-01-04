require './rental'
require './person'
require './book'
require 'date'

describe Rental do
  describe '#initialize' do
    it 'creates a rental with the given date, person, and book' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      person = Person.new(30, 'John Smith')
      rental = Rental.new(Date.today, person, book)
      expect(rental.date).to eq(Date.today)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end
  end
end
