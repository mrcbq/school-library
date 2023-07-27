require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    unless @students.include?(student)
      @students << student
      student.classroom = self
    end
  end
end