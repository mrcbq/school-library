require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(id: 1, name: 'John Doe', age: 35, specialization: 'Mathematics') }

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the teacher' do
      expected_hash = {
        class: 'Teacher',
        id: 1,
        name: 'John Doe',
        age: 35,
        parent_permission: true,
        specialization: 'Mathematics'
      }
      expect(teacher.to_hash).to eq(expected_hash)
    end
  end

  describe '.from_hash' do
    it 'creates a new Teacher instance from a hash' do
      teacher_hash = {
        'id' => 1,
        'name' => 'John Doe',
        'age' => 35,
        'parent_permission' => true,
        'specialization' => 'Mathematics'
      }
      new_teacher = Teacher.from_hash(teacher_hash)

      expect(new_teacher.id).to eq(1)
      expect(new_teacher.name).to eq('John Doe')
      expect(new_teacher.age).to eq(35)
    end
  end
end
