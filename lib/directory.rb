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
    @people.filter { |person| person.date_of_birth.day == target.day && person.date_of_birth.month == target.month }
  end

  def todays_birthdays
    today = Date.today
    list_by_date(today.year, today.month, today.day)
  end
end
