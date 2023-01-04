require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book)
    rental = Rental.new(Date.today, self, book)
    @rentals.push(rental)
  end  

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def to_json(*_args)
    {
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      id: @id
    }
  end

  private

  def generate_id
    @id = Random.rand(1..1000)
  end

  def of_age?
    @age >= 18
  end
end
