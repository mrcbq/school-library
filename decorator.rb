require_relative 'nameable'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  super()

  def correct_name
    @nameable.correct_name
  end
end
