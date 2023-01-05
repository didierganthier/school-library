require './student'

describe Student do
  describe '#initialize' do
    it 'sets the name and age attributes' do
      student = Student.new(15, 'John Smith')
      expect(student.name).to eq('John Smith')
      expect(student.age).to eq(15)
    end

    it 'sets the parent_permission attribute to false by default' do
      student = Student.new(15, 'John Smith')
      expect(student.parent_permission).to eq(false)
    end

    it 'allows the parent_permission attribute to be set' do
      student = Student.new(15, 'John Smith', parent_permission: true)
      expect(student.parent_permission).to eq(true)
    end
  end

  describe '#correct_name' do
    it 'returns the name of the student' do
      student = Student.new(15, 'John Smith')
      expect(student.correct_name).to eq('John Smith')
    end
  end

  describe '#play_hooky' do
    it 'returns a string' do
      student = Student.new(15, 'John Smith')
      expect(student.play_hooky).to be_a(String)
    end
  end

  describe '#classroom=' do
    it 'sets the classroom attribute' do
      student = Student.new(15, 'John Smith')
      classroom = Classroom.new('Room 1')
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end

    it "adds the student to the classroom's students array" do
      student = Student.new(15, 'John Smith')
      classroom = Classroom.new('Room 1')
      student.classroom = classroom
      expect(classroom.students).to eq([student])
    end
  end
end
