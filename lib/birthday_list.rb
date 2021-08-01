require 'date'

class BirthdayList
  attr_reader :list

  def initialize
    @list = []
  end
  
  def add birthday
    @list << birthday
    "Added birthday for #{birthday.name}"
  end

  def today
    todays = @list.select do |birthday|
      birthday.date.month == Date.today.month && birthday.date.day == Date.today.day
    end

    str = "Today's Birthdays:\n"

    todays.each do |birthday|
      age = Date.today.year - birthday.date.year
      str = str + "#{birthday.name} is #{age} today!\n"
    end

    str.chomp
  end
end
