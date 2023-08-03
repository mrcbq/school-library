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
    super.merge(
    {
      class:'Teacher',
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      specialization: @specialization
    })
  end

  def self.from_hash(hash)
    p hash
    name = hash["name"]
    age = hash["age"]
    parent_permission = hash["parent_permission"]
    specialization = hash["specialization"]
    teacher = Teacher.new(name: name, age: age, parent_permission: parent_permission, specialization: specialization)
    teacher
  end
end
