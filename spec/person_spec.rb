require_relative '../person'

RSpec.describe Person do
  let(:person) { Person.new(id: 1, name: 'John Doe', age: 25, parent_permission: true) }

  describe '#can_use_services?' do
    context 'when the person is of age' do
      let(:person) { Person.new(id: 1, name: 'John Doe', age: 18, parent_permission: false) }

      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is under age with parent permission' do
      let(:person) { Person.new(id: 1, name: 'John Doe', age: 16, parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is under age without parent permission' do
      let(:person) { Person.new(id: 1, name: 'John Doe', age: 16, parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to be(false)
      end
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the person' do
      expected_hash = {
        id: 1,
        name: 'John Doe',
        age: 25,
        parent_permission: true
      }
      expect(person.to_hash).to eq(expected_hash)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#rentals' do
    it 'returns an empty array by default' do
      expect(person.rentals).to eq([])
    end
  end
end
