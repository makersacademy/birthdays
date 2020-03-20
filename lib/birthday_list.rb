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

  private

  def print_friend_and_birthday(friend, birthday)
    puts "#{friend}#{COLUMN_SPACER}#{birthday}"
  end
end