# Birthdays

## Requirements/User Stories

I want a program that I can load in IRB that allows me to
- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.

More requirements:
- Test-drive extracting a birthday class
- Isolate your birthday list class using a mock for Birthday

## Domain Model

| Objects | Messages |
|---|---|
| User |  |
| BirthdayTracker | all (see all birthdays) <br> today (see today's birthdays) <br> store (add a birthday to storage) |