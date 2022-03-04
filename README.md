Birthdays Challenge
===================

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

```
       iiiiiiiiii
      |:H:a:p:p:y:|
    __|___________|__
   |^^^^^^^^^^^^^^^^^|
   |:B:i:r:t:h:d:a:y:|
   |                 |
   ~~~~~~~~~~~~~~~~~~~
```
[Image Credit](https://asciiart.website/index.php?art=events/birthday)


## Set Up

Fork this repository to your github account and clone it to your machine. Then install the dependencies:
```zsh
> git clone https://github.com/<Your GitHub Username>/birthdays.git
> cd birthdays
> bundle
```

## Requirements

The brief is as follows:

I want a program that I can load in IRB that allows me to
- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.

Further requirements were to:
- Test-drive extracting a birthday class
- Isolate your birthday list class using a mock for Birthday

## Instructions

1. This program is run from the Terminal/Command Line via irb
2. Ruby version 3.0.2 is recommended. To install using Ruby Version Manager:
```zsh
rvm install "ruby-3.0.2"
```
3. To run the program, use the following commands:
```zsh
irb
 :001 > require './lib/birthday_list.rb'
 => true
 :002 > require './lib/birthday.rb'
 => true
 :003 > require 'date'
 => true
```

## Example

Birthday instances are created with a `name` string and a `birthdate` Date object.

The BirthdayList `#birthday_check` method (passed a date object) is used to print an informative string about the birthdays on that day, while `#print_all_birthdays` prints all names and birthdays stored within the list.

```irb
 :004 > list = BirthdayList.new
 :005 > list.add(Birthday.new('Colin Caterpillar', Date.new(2007,9,25)))
 :006 > list.add(Birthday.new('Percy Pig', Date.new(2003,6,18)))
 :007 > list.add(Birthday.new('Freddy Frog', Date.new(1997,3,3)))
 :008 > list.birthday_check(Date.today)
#=> It is Freddy Frog's birthday today! They are 25 years old!
 :009 > list.print_all_birthdays
#=> Colin Caterpillar - 25/09
#=> Percy Pig - 18/06
#=> Freddy Frog - 03/03
```

## My Approach

- Extracted objects to model from the above requirements (BirthdayList and Birthday)
- Created written plan of approach
- Did **not** create a table of properties and methods
- Did **not** diagram relationships between classes
> Having since attended a workshop on Domain Modelling, these two missing steps would have helped greatly with the initial design
- Created birthday_list_spec file to drive creation of a BirthdayList class
  - Storing a string representing a birthday
  - Printing all stored birthdays
  - Checking for any birthdays today
- Created birthday_spec file to drive creation of a Birthday class
  - Storing name
  - Storing birthdate
  - Calculating age
- Refactored to use doubles instead of actual objects to isolate class tests
> Exception being Date -> those in the test are still actual Date objects
- Used Rubocop to correct formatting errors
- Used SimpleCov to check test coverage before submission
  - Identified un-used methods (print_birthdate)
  - wrote test to ensure BirthdayList#add was covered

## Technologies Used

- Ruby
- Rubocop (Makers Style Guide)
- SimpleCov (100% Test coverage as of 03/03/2022)

## Future Considerations

- Program might not correctly handle leap years when calculating age (hard-coded 365 days in a year - which is also a 'magic number')
- Next steps for the program
  - remove the current reliance on Date methods (#month, #day, the actual difference between two Date objects used in Birthday#age)
  - more elegant internal formatting of the birthday in print_all_birthdays
