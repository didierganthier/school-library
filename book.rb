require './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    # *the book itself should be sent as a parameter to create the new rental achieving the 'has-many' association.
    Rental.new(date, self, person)
  end
end
