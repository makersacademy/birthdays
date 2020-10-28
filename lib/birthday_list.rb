class Person
  def initialize(name, dob)
    @name = name
    @dob = dob
  end

  def dob
    return "#{@dob.day}/#{@dob.month}/#{@dob.year}"
  end
end
