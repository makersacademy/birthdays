require 'date'

class Directory
  attr_reader :people

  def initialize(people = [])
    @people = people
  end

  def add_person(person)
    @people.append(person)
  end
end