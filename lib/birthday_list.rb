def birthdays_list
  @birthdays = Hash.new
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


birthdays_list
puts add_birthday("Matt", "31st Jan")
puts add_birthday("Katie", "4th Jul")
puts add_birthday("Mum", "16th Oct")

puts store_birthdays
puts print_birthdays