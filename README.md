### Birthday Directory

This program is a TDD exercise as part of the Makers Academy Week 1 activities.

### Instructions

- Test-drive an implementation of the requirements
- Make sure your code is [linted](https://github.com/rubocop-hq/rubocop)
- [Open a PR](https://services.github.com/on-demand/github-cli/open-pull-request-github) when you've finished

### Requirements

#### Must haves
I want a program that I can load in IRB that allows me to
- Store all of my friends’ birthdays so I can keep track of them
- See them all at once with their names and birthdays each on a line in a tidy format
- Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.

#### Should haves
- Check that birthday is a valid date
- Check that birthday is not in the future

#### Extra todo's
- Test-drive extracting a birthday class
- Isolate your birthday list class using a mock for Birthday

### Functional Design

| Objects      | Messages                                                    |
|--------------|-------------------------------------------------------------|
| User         |                                                             |
| Birthday     | new                                                         |
| BirthdayList | store_birthday<br>print_birthdays<br>print_todays_birthdays |


### TDD resources

- https://github.com/makersacademy/course/blob/master/pills/tdd.md
- https://github.com/makersacademy/course/blob/master/pills/tdd_quality_discussion.md

### Mocking

- https://relishapp.com/rspec/rspec-mocks/docs/basics/test-doubles
