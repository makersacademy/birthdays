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

# Birthday itself should be a separate class - include methods based on the above requirements

class BirthdayList
  attr_reader :birthdays
  
  def initialize
    @birthdays = []
  end

  def add(birthday)
    @birthdays << birthday
  end

  def print_all_birthdays
    puts @birthdays
  end
end