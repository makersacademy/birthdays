require 'date'

class Directory
  attr_reader :people

  def initialize(people = [])
    @people = people
  end

  def add_person_to_list(person)
    @people.append(person)
  end

  def create_person_object
    
    name = gets.chomp
    birth_year = gets.chomp.to_i
    birth_month = gets.chomp.to_i
    birth_day = gets.chomp.to_i

    Person.new(name, Date.new(birth_year, birth_month, birth_day))
  end
end