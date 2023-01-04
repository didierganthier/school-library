require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './rental'
require './person'

describe Person do
  context"testing every method for Person class" do

    it "method initialize" do
      person = Person.new(18)
      expect(person.name).to eq "Unknown"
    end

    it "is of age?" do
      person = Person.new(20)
      expect(person.send(:of_age?)).to be true
    end

    it "correct name " do
      person = Person.new(10,"didier")
      expect(person.name).to eq "didier"
    end

    it "can use services?" do
      person = Person.new(20, "cesar")
      person.parent_permission = false
      expect(person.can_use_services?).to be true
    end

    it "generate_id?" do
      person = Person.new(31,"kay")
      person.id =

    end

  end
end
