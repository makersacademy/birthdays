=begin
  
Requirements
I want a program that I can load in IRB that allows me to:
- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have 
stored and check each one to see if it’s someone’s birthday, and tells me something 
like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it 
won't say anything.

User Story 1:
As a user,
So that i can keep track of my friends' birthdays
I want to store their birthdays

User Story 2:
As a user,
So that i can see upcoming birthdays 
I want to see them all at once with their name and birthday on a line

User Story 3:
As a user,
So that i can whose birthday it is today,
I want to check my list and get a message if it's someone's birthday
  
=end

require 'time'

class Birthday
  attr_reader :store

  def initialize
    @store = []
  end

  def save_birthday(name, date)
    @store << {name: name, date: date}
  end

  def print_list
    display_array = []
    @store.each { |entry| display_array << "Name: #{entry[:name]}, Date: #{entry[:date]}" }
    display_array.join("\n")
  end

  def check
  # get todays date
  date_string = Time.now.strftime("%d/%m")

  # compare with dates in store
  store_matches =  @store.select { |entry| entry[:date][0..4] == date_string }

  #create display strings 
  display_array = []
  store_matches.each do |entry|
    age = (Time.new.year - entry[:date][6..9].to_i)
    display_array << "It's #{entry[:name]}'s birthday today! They are #{age} years old!"
    end

  # output matches
  display_array.join("\n")
  end

end

