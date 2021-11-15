class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = []
  end

  def store_birthday(birthday = Birthday.new)
    @birthdays << birthday
  end

  def see_birthdays
    @birthdays.each { |birthday| puts "#{birthday.name}: #{birthday.date}"}
  end
end
