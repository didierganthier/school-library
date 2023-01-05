require './classroom'
require './student'

describe Classroom do
  describe '#initialize' do
    it 'creates a classroom with the given label' do
      classroom = Classroom.new('Room 101')
      expect(classroom.label).to eq('Room 101')
    end

    it 'creates an empty students array' do
      classroom = Classroom.new('Room 101')
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a student to the students array' do
      classroom = Classroom.new('Room 101')
      student = Student.new(12, 'Alice')
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end

    it "sets the student's classroom to the current classroom" do
      classroom = Classroom.new('Room 101')
      student = Student.new(12, 'Alice')
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
