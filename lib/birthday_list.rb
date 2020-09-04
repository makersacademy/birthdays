require 'date'

class BirthdayList
  def initialize
    @birthday_list = []
  end

  def store(name, dob)
    birthday = { name: name, dob: parse(dob) }
    @birthday_list << birthday
  end

  def print
    @birthday_list.each do |birthday|
      puts "#{birthday[:name]} (#{format_date(birthday[:dob])})"
    end
  end

  def check_todays
    @birthday_list.each do |birthday|
      if day_month(birthday[:dob]) == day_month(Date.today)
        puts "It's #{birthday[:name]}'s birthday today! They are #{age(birthday)} years old!"
      end
    end
  end

  private

  def parse(dob)
    Date.parse(dob)
    # TODO: handle exceptions if not a valid date format
  end

  def format_date(dob)
    dob.strftime('%-d %B %Y')
  end

  def day_month(dob)
    dob.strftime('%d-%m')
  end

  def age(person)
    Date.today.year - person[:dob].year
  end
end