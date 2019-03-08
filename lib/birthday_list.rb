class Birthdays
  
  def initialize
    @birthdays = {}
  end
  
  def add_birthday(name, date)
    @birthdays[name] = date
    "Birthday added!"
  end
  
  def store_birthdays
    @birthdays
  end
  
  def print_birthdays
    birthdays_list = []
    @birthdays.each do |name, date|
      birthdays_list << "#{name}: #{date}\n"
    end
    birthdays_list.join
  end

  def birthday_today?(today_date)
    todays_birthdays = []
    @birthdays.each do |name, date|
      if today_date[0, 5] == date[0, 5]
        todays_birthdays << "It's #{name}'s birthday today! "\
        "They are #{(today_date[6, 4].to_i - date[6, 4].to_i)} "\
        "years old!"
      end
    end
    todays_birthdays.join("\n")
  end

end

list = Birthdays.new

puts list.add_birthday("Matt", "04/07/1978")
puts list.add_birthday("Katie", "04/07/1980")
puts list.add_birthday("Mum", "16/10/1951")

puts list.store_birthdays
puts list.print_birthdays

puts list.birthday_today?("04/07/2019")
