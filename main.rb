# require_relative 'person'
# require_relative 'classroom'
# require_relative 'student'
# chemistry_class = Classroom.new(label: 'chemistry')
# math_class = Classroom.new(label: 'maths')
# Student.new(classroom: math_class, name: 'bob', age: 18)
# Student.new(classroom: chemistry_class, name: 'mrcbq', age: 29)
# puts chemistry_class.students.inspect
# puts math_class.students.inspect
require './app'

class Main
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to School Libary App!'

    loop do
      number_choice = list_of_options
      choice_selected(number_choice)
    end
  end

  def list_of_options
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - Exit'
    puts
    gets.chomp.to_i
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def choice_selected(number)
    case number
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_by_id
    when 7
      puts 'Thanks for using the school library App!'
      exit
    else
      puts 'Invalid number: Please enter a valid number next time'
    end
    # rubocop:enable Metrics/CyclomaticComplexity
  end
end

def main
  main = Main.new
  main.start
end

main