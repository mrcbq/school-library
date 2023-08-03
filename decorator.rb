# frozen_string_literal: true

require_relative 'nameable'

# Represents a decorator base class.
class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end
