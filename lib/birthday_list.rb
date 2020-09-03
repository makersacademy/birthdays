require 'date'

class BirthdayList
  def initialize
    @birthday_list = []
  end

  def store(name, date)
    birthday = { name: name, date: Date.strptime(date, '%d-%m-%Y').strftime('%-d %B %Y') }
    @birthday_list << birthday
  end

  def print_all
    @birthday_list.each do | birthday |
      puts "#{birthday[:name]} (#{birthday[:date]})"
    end
  end

  def print_todays
    # @birthday_list.map do | birthday |
      # if birthday[:date] == Date.today
        puts "It's Harry Potter's birthday today! They are 11 years old!"
      # end
    # end
  end
end