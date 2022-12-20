class Rental
  attr_reader :book, :person, :date

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
    book.rentals << self
    person.rentals << self
  end
end
