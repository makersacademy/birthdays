require 'date'

class BirthdayList
  def initialize
    @birthday_list = []
  end

  def store(name, date)
    birthday = { name: name, date: Date.strptime(date, '%d-%m-%Y').strftime('%-d %B %Y') }
    @birthday_list << birthday
  end

  def print
    @birthday_list.each do |birthday|
      puts "#{birthday[:name]} (#{birthday[:date]})"
    end
  end

  def check_todays
    @birthday_list.each do |birthday|
      if Date.parse(birthday[:date]).strftime('%d-%m') == Date.today.strftime('%d-%m')
        puts "It's #{birthday[:name]}'s birthday today! They are #{Date.today.year - Date.parse(birthday[:date]).year} years old!"
      end
    end
  end
end