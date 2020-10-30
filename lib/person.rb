class Person
  attr_reader :name

  def initialize(name, birth_year, birth_month, birth_day)
    @name = name
    @dob = Date.new(birth_year, birth_month, birth_day)
  end

  def dob
    "#{@dob.day}/#{@dob.month}/#{@dob.year}"
  end
end