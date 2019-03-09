class Birthdays
  attr_reader :list

  def initialize
    @list = []
  end

  def add_birthday(person)
    @list << person
  end

  def show_all
  end

  def match_birthday
  end

  def age
  end
end