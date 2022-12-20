require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    # *The person itself should be sent as a parameter to create the new rental achieving the 'has-many' association
    Rental.new(date, book, self)
  end

  private

  def generate_id
    # code to generate unique id
  end

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
