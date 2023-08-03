# frozen_string_literal: true

require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  let(:classroom) { Classroom.new(label: 'Science') }
  let(:student) { Student.new(id: 1, name: 'John Doe', age: 18, parent_permission: true, classroom: classroom) }

  describe '#initialize' do
    it 'creates a new student with valid attributes' do
      expect(student.name).to eq('John Doe')
      expect(student.age).to eq(18)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds the student to the classroom' do
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a string representing playing hooky' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
