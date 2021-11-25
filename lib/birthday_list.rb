require_relative "birthday"

class BirthdayList

  MONTHS = ["unknown", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]


  def initialize
    @birthdays = []
  end

  def add_birthday(birthday)
    @birthdays << birthday
  end

  def show_birthdays
    @birthdays.each { |person| puts "#{person.name}'s birthday is #{month_text(person.month)} #{person.day}, #{person.year}"}
  end

  def month_text(month)
    MONTHS[month]
  end

end
