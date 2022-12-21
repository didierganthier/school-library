class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, person, book)
    @book = book
    @person = person
    @date = date
  end
end
