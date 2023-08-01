require_relative 'person'

class Teacher < Person
  def initialize(name: 'Unknown', age: nil, specialization: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      specialization: @specialization
    }
end
