# frozen_string_literal: true

require './app'

# Represents the main class for the application entry point.
class Main
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to School Library App!'

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
    puts 'Another option -> Exit'
    gets.chomp.to_i
  end

  def choice_selected(number)
    case number
    when 1 then @app.list_all_books
    when 2 then @app.list_all_people
    when 3 then @app.create_person
    when 4 then @app.create_book
    when 5 then @app.create_rental
    when 6 then @app.list_rentals_by_id
    else
      exit_app
    end
  end
end

def exit_app
  puts 'Thanks for use this app, I will be exit right now'
  @app.exit
  exit
end

def main
  main = Main.new
  main.start
end

main
