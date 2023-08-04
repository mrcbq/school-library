# this is inherited from the person class

require_relative 'classroom'
require_relative 'person'

# Represents a student.
class Student < Person
  attr_reader :classroom

  def initialize(id: nil, classroom: 'Unknown', name: 'Unknown', age: nil, parent_permission: true)
    super(id: id, name: name, age: age, parent_permission: parent_permission)
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
    super.merge(
      {
        class: 'Student',
        name: @name,
        age: @age,
        parent_permission: @parent_permission,
        classroom: @classroom
      }
    )
  end

  def self.from_hash(hash)
    id = hash['id']
    name = hash['name']
    age = hash['age']
    parent_permission = hash['parent_permission']
    classroom = hash['classroom']
    Student.new(id: id, name: name, age: age, parent_permission: parent_permission, classroom: classroom)
  end
end
