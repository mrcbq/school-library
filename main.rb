require_relative 'person'
require_relative 'classroom'
require_relative 'student'

require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# person = Person.new(22, 'maximilianus')
# puts person.correct_name # Output: maximilianus

# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name # Output: Maximilianus

# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name # Output: Maximilian

chemistry_class = Classroom.new('chemistry')
math_class = Classroom.new('maths')

student = Student.new(math_class, 'bob', 18)
student1 = Student.new(chemistry_class, 'mrcbq', 29)

puts chemistry_class.students.inspect
puts math_class.students.inspect
