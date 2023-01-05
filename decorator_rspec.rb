require './decorator'

describe Decorator do
  describe '#initialize' do
    it 'creates a decorator with the given nameable' do
      nameable = Nameable.new
      decorator = Decorator.new(nameable)
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name of the nameable' do
      nameable = double('nameable')
      allow(nameable).to receive(:correct_name).and_return('John Smith')
      decorator = Decorator.new(nameable)
      expect(decorator.correct_name).to eq('John Smith')
    end
  end
end
