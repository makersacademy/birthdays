class Person
  attr_reader :name

  def initialize(name, dob)
    @name = name
    @dob = dob
  end

  def dob
    "#{@dob.day}/#{@dob.month}/#{@dob.year}"
  end
end

class Directory
  attr_reader :people

  def initialize(people = [])
    @people = people
  end

  def add_person(person)
    @people.append(person)
  end
end
