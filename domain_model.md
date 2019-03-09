## Client requirements:

- Store all of my friends’ birthdays so I can keep track of them

- See them all at once with their names and birthdays each on a line in a tidy format

- Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.

- Test-drive extracting a birthday class

- Isolate your birthday list class using a mock for Birthday

Nouns: birthdays, friends
Verbs: store, show_all, match_birthday

### Domain Model

| Subject   | Action         |
| --------- | -------------- |
| Birthdays | add_birthday   |
|           | show_all       |
|           | match_birthday |
|           | age            |
| Friend    |                |

###

User stories

- As a user, I want to add my friend's birthday to a list
- As a user, I want to be able to see all the birthdays I have stored in my list
- As a user, I want to see if one of my friend's birthday is today
- As a user, I want to know my friend's age

#### add_birthday method

- takes a Friend object which has name: and birthday: as attributes
- data will be stored in a hash
  - key [string]: birthday_object of Time class
  - value [string_in_array]: friend's name (first_name second_name)

Example: { "10 January 1960" => "John Adams" }
Example 2: {
"10 January 1960" => ["John Adams", "May Day"]
}

#### show_all

- takes no arguments
- iterates through each birthday and lists date and name as below

Date: 10 January
Name:

1. John Adam - Age (50)
2. May Day - Age (50)

#### match_birthday

- takes no argument
- iterates through each birthday and matches only on day and month
- returns matching person's for today's date with their age
- age(bday) method is used here

Format if match:
"It's John Adam's birthday today! He is 50 years old!" - otherwise it won't say anything.
"It's May Day's birthday today! He if 50 years old!"

Format if no match:
Say nothing if no match.

#### age(bday)

- takes one argument - bday of a matched person
- returns his age
