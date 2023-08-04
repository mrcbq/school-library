require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'Original Name') }

  describe '#correct_name' do
    context 'when the original name is less than or equal to 10 characters' do
      it 'returns the original name' do
        allow(nameable).to receive(:correct_name).and_return('Short Name')
        trimmer_decorator = TrimmerDecorator.new(nameable)

        expect(trimmer_decorator.correct_name).to eq('Short Name')
      end
    end

    context 'when the original name is longer than 10 characters' do
      it 'returns the first 10 characters of the original name' do
        allow(nameable).to receive(:correct_name).and_return('Very Long Name')
        trimmer_decorator = TrimmerDecorator.new(nameable)

        expect(trimmer_decorator.correct_name).to eq('Very Long ')
      end
    end
  end
end
