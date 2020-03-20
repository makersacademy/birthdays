require_relative './birthday'

class BirthdayList
  COLUMN_SPACER = "\t\t\t"

  def initialize 
    @friends_and_birthdays = {}
  end

  def store(name, birthday)
    @friends_and_birthdays[name] = birthday
    "Birthday stored!"
  end

  def print_stored_friends
    @friends_and_birthdays.each do |friend, birthday|
      print_friend_and_birthday(friend, birthday)
    end
  end

  def print_todays_birthdays
    today = Time.now
    @friends_and_birthdays.each do |friend, birthday|
      if is_birthday_today?(birthday, today)
        friend_age = calculate_friend_age(birthday, today)
        puts "It's #{friend}'s birthday today! They are #{friend_age} years old!"
      end
    end
  end

  private

  def print_friend_and_birthday(friend, birthday)
    puts "#{friend}#{COLUMN_SPACER}#{birthday.to_s}"
  end

  def is_birthday_today?(birthday, today)
    birthday.date.month == today.month && birthday.date.day == today.day
  end

  def calculate_friend_age(birthday, today)
    today.year - birthday.date.year
  end
end