require './trimmer_decorator'

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'returns the first 10 characters of the correct name of the nameable' do
      nameable = double('nameable')
      allow(nameable).to receive(:correct_name).and_return('john smith')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('john smith')

      nameable = double('nameable')
      allow(nameable).to receive(:correct_name).and_return('john smith is a very long name')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('john smith')
    end
  end
end
