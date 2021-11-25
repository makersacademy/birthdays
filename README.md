# Birthday List

## Overview

- I completed this challenge as part of my self learning during my time at Makers bootcamp.
- I implemented a program that can store birthdays and provide information about the stored birthdays to meet the below requirement.
- My program was written in Ruby in line with the principles of Test-Driven Development.
- When testing the `BirthdayList` class, I used doubles for the `Birthday` class in order to isolate classes.

## Requirements

I want a program that I can load in IRB that allows me to
- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.

More requirements:
- Test-drive extracting a birthday class
- Isolate your birthday list class using a mock for Birthday

## Approach

- This program is implemented using two classes: `Birthday` and `BirthdayList`.

### **Birthday Class**

**Dependencies**

```
require "date"
```

**Initialization**

```
  attr_reader :name, :day, :month, :year

  def initialize(name, day, month, year)
    @name = name
    @day = day
    @month = month
    @year = year
  end
```

Class is initialized with name, day, month, year arguments. An attribute reader is used to allow access to these variables in other methods.

**Calculate age**

```
  def calculate_age
    birthday = Date.parse("#{@day}/#{month}/#{year}")
    age_in_days = (Date.today - birthday).to_i
    age_in_days / 365
  end
```

Uses the external "date" class to compare the person's age to the current date to calculate age.

****

### **BirthdayList Class**

**Dependencies**

```
require_relative "birthday"
```

**Initialization**

```
  def initialize
    @birthdays = []
  end
```

Starts with empty list.

**Add birthday**

```
  def add_birthday(birthday)
    @birthdays << birthday
  end
```
Adds birthday to the list of birthdays.

**Month to text**

```
  MONTHS = ["unknown", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def month_text(month)
    MONTHS[month]
  end
```
Converts a numerical month into a string month using the MONTHS constant. For example, if the user enters 5, it will return "May".

**Show birthdays**

```
  def show_birthdays
    @birthdays.each { |person| puts "#{person.name}'s birthday is #{month_text(person.month)} #{person.day}, #{person.year}" }
  end
```
Shows all birthdays in the list in a tiday format, e.g. "Kim's birthday is May 13, 1991"

**Today's birthday**
```
  def todays_birthday
    today = @birthdays.select { |person| person.day == Date.today.day && person.month == Date.today.month }
    today.each { |person| puts "It's #{person.name}'s birthday today! They are #{person.calculate_age} years old!" }
  end
```

Shows all people in the birthday list whose birthday it is today, in the format "It's Mary Poppin's birthday today! They are 124 years old!"


