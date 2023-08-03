# frozen_string_literal: true

require_relative 'decorator'

# Represents a decorator that capitalizes names.
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
