require 'date'

class BirthdayList
  DEFAULT_FORMAT = "%d/%m/%Y"
  attr_reader :birthdays

  def initialize
    @birthdays = {}
  end

  def store name, date
    @birthdays[name] = Date.parse(date)
  end

  def show
    puts "Name".ljust(30) + "Birthday"
    @birthdays.each do |name, b_day|
      puts name.ljust(30) + b_day.strftime(DEFAULT_FORMAT)
    end
    return
  end

  def check_today
    @birthdays.each do |name, b_day|
      if b_day.month == Date.today.month && b_day.day == Date.today.day
        age = Date.today.year - b_day.year
        puts "It's #{name}'s birthday today! They are #{age} years old!"
      end
    end
    return
  end
end
