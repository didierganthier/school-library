require './person'

class Student < Person
    attr_reader :classroom
    def initialize(age, classroom, name: "Unknown", parent_permission: true)
      super(age, name: name, parent_permission: parent_permission)
      @classroom = classroom
    end
  
    def play_hooky
      "¯\\(ツ)/¯"
    end
end
  
student = Student.new(16, "Classroom 1", name: "Jane", parent_permission: true)
puts student.name # prints "Jane"
puts student.age # prints 16
puts student.classroom # prints "Classroom 1"
puts student.can_use_services? # prints true
puts student.play_hooky # prints "¯\(ツ)/¯"