require 'date'

class BirthdayList

  @birthday_list = []

  def self.store_birthday(name, date)
    birthday = { name: name, date: Date.strptime(date, '%d-%m-%Y') }
    @birthday_list << birthday
    "Birthday stored!"
  end

  def self.print_birthdays
    @birthday_list.each do | birthday |
      puts "#{birthday[:name]} (#{birthday[:date].strftime('%-d %B %Y')})"
    end
  end

end