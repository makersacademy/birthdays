class BirthdayList

  def initialize
    @birthdays = []
  end

  def add_birthday(birthday)
    @birthdays << birthday
  end

  def show_birthdays
    @birthdays
  end

end
