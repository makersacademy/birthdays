# I want a program that I can load in IRB that allows me to
# - Store all of my friends’ birthdays so I can keep track of them
  # maintains data structure of names and birthdates
# - See them all at once with their names and birthdays each on a line in a tidy format
  # prints all birthdays in pretty format
# - Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything
  # registers the date today
  # compares against a stored record
  # returns a formatted string of name and age
    # needs to calculate age

class BirthdayList
  def initialize
    @birthdays = []
  end

  def size
    @birthdays.count
  end

  def add(birthday)
    @birthdays << birthday
  end

  def birthday_check(today)
    @birthdays.each do |birthday|
      print_reminder(birthday) if birthday.birthday_today?(today)
    end
  end

  def print_all_birthdays
    @birthdays.each do |birthday|
      puts "#{birthday.name} - #{friendly_date(birthday.birthdate)}"
    end
  end

  private

  def friendly_date(date)
    "#{pad_number(date.day)}/#{pad_number(date.month)}"
  end

  def pad_number(number)
    number.to_s.rjust(2, '0')
  end

  def print_reminder(birthday)
    output = "It is #{birthday.name}'s birthday today!"\
            " They are #{birthday.age} years old!"
    puts output
  end
end