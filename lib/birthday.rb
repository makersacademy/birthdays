require_relative 'directory'
require_relative 'person'
require 'colorize'

class Birthdays
  attr_reader :people

  def initialize
    @people = Directory.new
  end

  def print_header
    puts "⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️"
    puts "⭐️   Birthday Calendar!    ⭐️".blue
    puts "⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️ ⭐️"
    puts ""
  end

  def add_person
    puts "Enter their name:"
    name = gets.chomp
    puts "Enter the year of birth:"
    year = gets.chomp.to_i
    puts "Enter the month of birth:"
    month = gets.chomp.to_i
    puts "Enter the day of birth:"
    day = gets.chomp.to_i

    @people.add_person(Person.new(name, year, month, day))
    puts ""
    puts "#{name} successfully added!".red
    puts ""
  end

  def all_birthdays
    puts ""
    @people.people.each { |person| puts "It's #{person.name}'s birthday on #{person.dob}" }
    puts ""
  end

  def print_options
    puts "Press 1 to add a birthday"
    puts "Press 2 to display all birthdays"
    puts "Press 3 to display all of today's birthdays"
    puts "Enter 'quit' to quit"
  end

  def todays_birthdays
    p Date.today
    p @people.todays_birthdays

    if @people.todays_birthdays.length.zero?
      puts "No one has a birthday today 😭"
      return
    else
      @people.todays_birthdays.each { |person| puts "It's #{person.name}'s birthday today! 🥳" }
    end
  end

  def interactive_menu
    loop do
      print_options
      input = gets.chomp
      break if input == 'quit'

      if input.to_i == 1
        add_person
      elsif input.to_i == 2
        all_birthdays
      elsif input.to_i == 3
        todays_birthdays
      end
    end
  end
end
