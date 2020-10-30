class Person
  attr_reader :name, :date_of_birth

  def initialize(name, birth_year, birth_month, birth_day)
    @name = name
    @date_of_birth = Date.new(birth_year, birth_month, birth_day)
  end

  def dob
    "#{@date_of_birth.day}/#{@date_of_birth.month}/#{@date_of_birth.year}"
  end
end