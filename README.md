# Birthdays

This repository contains the project I created working through the Birthdays TDD exercise during week 1 at Makers Academy. It was initially forked from a repository that contains a lot of scaffolding, a quick-start and instructions.

## Exercise instructions

- Test-drive an implementation of the given requirements
- Lint your code
- Open a Pull Request when you're finished

## Requirements

I want a program that I can load in IRB that allows me to:

- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.

More requirements:

- Test-drive extracting a birthday class
- Isolate your birthday list class using a mock for Birthday

### User stories

```
As a user
I can store my friends' birthdays so I can keep track of them
```

```
As a user
I can see all of my friends' names and birthdays.
- it must print each friend on one line in a tidy format
```

```
As a user
I can check whose birthday it is today
- it must tell me something like ""It's Mary Poppin's birthday today! They are 124 years old!"
- if there are no birthdays for that day it must print nothing
```