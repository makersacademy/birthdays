class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = []
  end

  def store_birthday(birthday)
    @birthdays << birthday
  end
end
