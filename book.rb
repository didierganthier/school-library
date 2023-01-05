require './rental'
require 'date'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person)
    rental = Rental.new(Date.today, person, self)
    @rentals.push(rental)
  end
end
