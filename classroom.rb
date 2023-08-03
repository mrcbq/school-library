require_relative 'student'

# Represents a classroom in the school.
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label: 'Unknown')
    @label = label
    @students = []
  end

  def add_student(student)
    return if @students.include?(student)

    @students << student
    student.classroom = self
  end
end
