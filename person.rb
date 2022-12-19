require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
    attr_reader :id, :name, :age
    attr_writer :name, :age
  
    def initialize(age, name, parent_permission: true)
      @id = generate_id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    private
    def generate_id
      # code to generate unique id
    end
  
    def is_of_age?
      @age >= 18
    end
  
    public
    def can_use_services?
      is_of_age? || @parent_permission
    end

    def correct_name
      @name
    end
  end