require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './rental'
require './person'

describe Person do
  describe '#initialize' do
    it 'creates a person with the given name and age' do
      person = Person.new(30, 'John Smith')
      expect(person.name).to eq('John Smith')
      expect(person.age).to eq(30)
    end

    it 'creates a person with the given name and age and parent permission' do
      person = Person.new(30, 'John Smith', parent_permission: true)
      expect(person.name).to eq('John Smith')
      expect(person.age).to eq(30)
      expect(person.parent_permission).to be true
    end

    it 'creates a person with the given name and age and default parent permission' do
      person = Person.new(30, 'John Smith')
      expect(person.name).to eq('John Smith')
      expect(person.age).to eq(30)
      expect(person.parent_permission).to be true
    end

    it 'creates a person with a unique ID' do
      person1 = Person.new(30, 'John Smith')
      person2 = Person.new(30, 'John Smith')
      expect(person1.id).to_not eq(person2.id)
    end
  end
end
