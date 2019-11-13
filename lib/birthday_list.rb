class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = {}
  end

  def store name, date
    @birthdays[name] = date
  end

  def show
    puts "Name".ljust(30) + "Birthday"
    @birthdays.each { |name, b_day| puts name.ljust(30) + b_day }
  end
end
