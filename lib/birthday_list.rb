require 'Date'

class BirthdayList
  def initialize
    @entries = []
  end

  def add(birthday)
    @entries << birthday
    @entries.last
  end

  def show
    puts "Name: Birthday"
    @entries.sort_by{ |birthday| birthday.last_name }.each do |birthday|
      puts "#{birthday.name}: #{birthday.formatted_date}"
    end
  end

  def find_birthday_today
    unless birthday == nil
      puts "It's #{birthday.name}'s birthday today! They are #{birthday.age} years old!"
    end
  end

  private

  def birthday
    @entries.find do |birthday|
      today = Date.today
      birthday.date.day == today.day and birthday.date.month == today.month
    end
  end
end
