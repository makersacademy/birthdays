class Birthdays
  attr_reader :list

  def initialize
    @list = []
  end

  def store(person)
    @list << person
  end

  def view_all
    @list.each do |record| 
      puts "Name: #{record.name} | Birthday: #{record.birthday}"
    end
  end

  def check_birthday
  end

  def age
  end
end