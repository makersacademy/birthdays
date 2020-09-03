require 'date'

class BirthdayList

  @birthday_list = []

  def self.store_birthday(name, date)
    birthday = { name: name, date: Date.strptime(date, '%d-%m-%Y').strftime('%-d %B %Y') }
    @birthday_list << birthday
  end

  def self.print_birthdays
    @birthday_list.each do | birthday |
      puts "#{birthday[:name]} (#{birthday[:date]})"
    end
  end

end