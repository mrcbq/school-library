require_relative 'classroom'
require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom: 'Unknown', name: 'Unknown', age: nil, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_hash
    {
      class: 'Student',
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom
    }
  end

  def self.from_hash(hash)
    p hash
    name = hash["name"]
    age = hash["age"]
    parent_permission = hash["parent_permission"]
    classroom = hash["classroom"]
    student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom)
    student
  end
end
