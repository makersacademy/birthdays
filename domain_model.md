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
| Friend    |                |

###

User stories

- As a user, I want to add my friend's birthday to a list
- As a user, I want to be able to see all the birthdays I have stored in my list
- As a user, I want to see if one of my friend's birthday is today
