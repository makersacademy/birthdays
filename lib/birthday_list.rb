def birthdays_list
  @birthdays = Hash.new
end

def add_birthday(name, date)
  @birthdays[name] = date
  "Birthday added!"
end

def show_birthdays
  @birthdays
end


birthdays_list
puts add_birthday("Matt", "31st Jan")
puts add_birthday("Katie", "4th Jul")
puts add_birthday("Mum", "16th Oct")

puts show_birthdays