def add_birthday(name, date)
  @birthdays = Hash.new
  @birthdays[name] = date
  "Birthday added!"
end

def show_birthdays
  return @birthdays
end