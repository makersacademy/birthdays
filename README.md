# Birthdays 🥳

A Ruby command line application that can
- Store friends’ birthdays and keep track of them.
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today.

## Quick start
```bash
> git clone https://github.com/ehwus/birthdays.git
> cd birthdays
> bundle install
> ruby ./lib/main.rb
```

## Instructions

- Follow the prompts to add people to your database or to print the required information out..

## Techniques Used

This was mainly an exercise in Test Driven Development, so I've ensured that all main methods and classes are fully tested in the specifications in ./spec. Use the 'rspec' command to run these yourself.

I have also been learning encapsulation, so I've divided the app into a series of classes:

 - **Person** - the basic object for the exercise, containing variables for both name and date of birth.
 - **Directory** - a class to store Persons, with some higher level methods like #todays_birthdays to perform operations on the stored Persons.
 - **Birthday** - the main class for the end user, provides a way for the other classes to be interacted with through stdin/stdout.
