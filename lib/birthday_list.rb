class Birthdays
  attr_reader :list

  def initialize
    @list = []
  end

  def store(person)
    @list << person
  end

  def view_all
  end

  def check_birthday
  end

  def age
  end
end