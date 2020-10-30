require 'date'

class Directory
  attr_reader :people

  def initialize(people = [])
    @people = people
  end

  def add_person(person)
    @people.append(person)
  end

  def list_by_date(year, month, day)
    target = Date.new(year, month, day)
    @people.filter { |person| person.dob == "#{target.day}/#{target.month}/#{target.year}"
    }

  end
end
