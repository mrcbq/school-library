# frozen_string_literal: true

require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new(label: 'Science') }
  describe '#initialize' do
    it 'creates a new classroom with valid attributes' do
      expect(classroom.label).to eq('Science')
      expect(classroom.students).to eq([])
    end
    it 'has default values for label and students' do
      classroom = Classroom.new
      expect(classroom.label).to eq('Unknown')
      expect(classroom.students).to eq([])
    end
    it 'adds a student to the classroom' do
      student = Student.new(id: 1, name: 'John Doe', age: 18, parent_permission: true)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
