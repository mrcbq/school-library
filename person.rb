require_relative 'rental'
require_relative 'nameable'
require_relative 'book'

# Represents a person (base class for students and teachers).
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(id: nil, name: 'Unknown', age: nil, parent_permission: true)
    @id = id || generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def to_hash
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }
  end

  private

  def of_age?
    @age.to_i >= 18
  end

  def generate_id
    rand(1000..9999)
  end
end
