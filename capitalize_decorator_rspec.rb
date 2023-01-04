require './capitalize_decorator'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'returns the correct name of the nameable, capitalized' do
      nameable = double('nameable')
      allow(nameable).to receive(:correct_name).and_return('john')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('John')
    end
  end
end
