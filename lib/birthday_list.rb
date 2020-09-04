require 'date'

class BirthdayList
  def initialize
    @birthday_list = []
  end

  def store(name, date)
    birthday = { name: name, date: parse(date) }
    @birthday_list << birthday
  end

  def print
    @birthday_list.each do |birthday|
      puts "#{birthday[:name]} (#{format_date(birthday[:date])})"
    end
  end

  def check_todays
    @birthday_list.each do |birthday|
      if day_month(birthday[:date]) == day_month(Date.today)
        puts "It's #{birthday[:name]}'s birthday today! They are #{age(birthday)} years old!"
      end
    end
  end

  private

  def parse(date)
    Date.parse(date)
    # TODO: handle exceptions if not a valid date format
  end

  def format_date(date)
    date.strftime('%-d %B %Y')
  end

  def day_month(date)
    date.strftime('%d-%m')
  end

  def age(person)
    Date.today.year - person[:date].year
  end
end