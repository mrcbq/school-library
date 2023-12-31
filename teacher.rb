require_relative 'person'

# Represents a teacher.
class Teacher < Person
  def initialize(id: nil, name: 'Unknown', age: nil, specialization: 'Unknown', parent_permission: true)
    super(id: id, name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    super.merge(
      {
        class: 'Teacher',
        name: @name,
        age: @age,
        parent_permission: @parent_permission,
        specialization: @specialization
      }
    )
  end

  def self.from_hash(hash)
    id = hash['id']
    name = hash['name']
    age = hash['age']
    parent_permission = hash['parent_permission']
    specialization = hash['specialization']
    Teacher.new(id: id, name: name, age: age, parent_permission: parent_permission,
                specialization: specialization)
  end
end
