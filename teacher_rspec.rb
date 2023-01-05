require './teacher'
require './person'

describe Teacher do
  describe '#initialize' do
    it 'creates a teacher with the given name, age, and specialization' do
      teacher = Teacher.new(30, 'Math', 'John Smith')
      expect(teacher.name).to eq('John Smith')
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
    end

    it 'creates a teacher with the given name, age, specialization, and parent permission' do
      teacher = Teacher.new(30, 'Math', 'John Smith', parent_permission: true)
      expect(teacher.name).to eq('John Smith')
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.parent_permission).to be true
    end

    it 'creates a teacher with the given name, age, specialization, and default parent permission' do
      teacher = Teacher.new(30, 'Math', 'John Smith')
      expect(teacher.name).to eq('John Smith')
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.parent_permission).to be true
    end

    it 'creates a teacher with a unique ID' do
      teacher1 = Teacher.new(30, 'Math', 'John Smith')
      teacher2 = Teacher.new(30, 'Math', 'John Smith')
      expect(teacher1.id).to_not eq(teacher2.id)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      teacher = Teacher.new(30, 'Math', 'John Smith')
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the teacher' do
      teacher = Teacher.new(30, 'Math', 'John Smith')
      expected_json = {
        age: 30,
        name: 'John Smith',
        parent_permission: true,
        id: teacher.id
      }
      expect(teacher.to_json).to eq(expected_json)
    end
  end
end
