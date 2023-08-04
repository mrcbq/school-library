require_relative '../decorator'

RSpec.describe Decorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'Original Name') }

  describe '#correct_name' do
    it 'calls the correct_name method on the wrapped nameable' do
      decorator = Decorator.new(nameable)

      expect(decorator.correct_name).to eq('Original Name')
    end
  end
end
