=begin
  
Requirements
I want a program that I can load in IRB that allows me to:
- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have 
stored and check each one to see if it’s someone’s birthday, and tells me something 
like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it 
won't say anything.

User Story:
As a user,
So that i can keep track of my friends' birthdays
I want to store their birthdays

As a user,
So that i can see upcoming birthdays 
I want to see them all at once with their name and birthday on a line
  
=end

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

end

