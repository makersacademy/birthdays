require 'birthday'
require 'time'

class Birthdays
  attr_reader :list

  def initialize
    @list = []
  end

  def store(birthday)
    @list << birthday
  end

  def view_all
    @list.each do |record| 
      time = time_to_string(record.birthday)
      puts "Name: #{record.name} | Birthday: #{time}"
    end
  end

  def check_birthday
    names = @list.select do |record|
      date_short_format(record.birthday) == date_short_format(Time.now)
    end

    names.each do |name|
      puts "It's #{name.name}'s birthday today! " +
      "They are #{age(name)} years old!"
    end
  end

  private
  
  def age(name)
    Time.now.year - name.birthday.year
  end

  def date_short_format(date)
    date.strftime("%d-%m")
  end

  def time_to_string(date)
    date.strftime("%d %B %Y")
  end

end
