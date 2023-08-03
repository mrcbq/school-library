require_relative '../person'  
require_relative '../student'  
require_relative '../classroom' 

RSpec.describe Student do
  let(:classroom) { Classroom.new(label: 'Science') }

  describe '#initialize' do
    it 'creates a new student with valid attributes' do
      student = Student.new(id: 1, name: 'John Doe', age: 18, parent_permission: true, classroom: classroom)
      expect(student.name).to eq('John Doe')
      expect(student.age).to eq(18)
      expect(student.classroom).to eq(classroom)
    end

    it 'has default values for classroom and name' do
      student = Student.new(id: 1, age: 18, parent_permission: true)
      expect(student.name).to eq('Unknown')
      expect(student.classroom).to eq('Unknown')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds the student to the classroom' do
      student = Student.new(id: 1, name: 'John Doe', age: 18, parent_permission: true)
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    it 'does not duplicate the student in the classroom' do
      student = Student.new(id: 1, name: 'John Doe', age: 18, parent_permission: true, classroom: classroom)
      classroom.students.push(student)
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end

  describe '#play_hooky' do
    it 'returns a string representing playing hooky' do
      student = Student.new(id: 1, name: 'John Doe', age: 18, parent_permission: true)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the student' do
      student = Student.new(id: 1, name: 'John Doe', age: 18, parent_permission: true, classroom: classroom)
      expected_hash = {
        id: 1,
        class: 'Student',
        name: 'John Doe',
        age: 18,
        parent_permission: true,
        classroom: classroom
      }
      expect(student.to_hash).to eq(expected_hash)
    end
  end

  describe '.from_hash' do
    it 'creates a new student from a hash' do
      student_hash = {
        'id' => 1,
        'class' => 'Student',
        'name' => 'John Doe',
        'age' => 18,
        'parent_permission' => true,
        'classroom' => classroom
      }
      student = Student.from_hash(student_hash)
      expect(student.id).to eq(1)
      expect(student.name).to eq('John Doe')
      expect(student.age).to eq(18)
      expect(student.classroom).to eq(classroom)
    end
  end
end
