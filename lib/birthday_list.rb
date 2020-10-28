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
