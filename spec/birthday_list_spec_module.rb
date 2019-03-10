module BirthdayHelperMethodsModule
  def create_and_add_two_birthdays 
    birthday1 = double(name: "John Adams", birthday: Time.new(1795, 1, 10))
    birthday2 = double(name: "May Day", birthday: Time.new(1795, 1, 10))
    subject.store(birthday1)
    subject.store(birthday2)
  end

  def create_two_matched_birthdays
    m = Time.now.month
    d = Time.now.day
    birthday1 = double(name: "John Adams", birthday: Time.new(1795, m, d))
    birthday2 = double(name: "John Adams", birthday: Time.new(1795, m, d))
    subject.store(birthday1)
    subject.store(birthday2)
  end

  def create_one_matching_birthday
    m = Time.now.month
    d = Time.now.day
    birthday1 = double(name: "John Adams", birthday: Time.new(2000, m, d))
    subject.store(birthday1)
  end

  def data_for_show_all_birthdays
    date1 = Time.new(1795, 1, 10).strftime("%d %B %Y")
    date2 = Time.new(2000, 1, 17).strftime("%d %B %Y")
    birthday1 = Birthday.new("John", "Adams", date1)
    birthday2 = Birthday.new("May", "Day", date2)
    subject.store(birthday1)
    subject.store(birthday2)
  end

  def data_two_matching_birthdays
    date1 = Time.new(1795, 3, 10).strftime("%d %B %Y")
    date2 = Time.new(2000, 3, 10).strftime("%d %B %Y")
    date3 = Time.new(1985, 1, 1).strftime("%d %B %Y")
    birthday1 = Birthday.new("John", "Adams", date1)
    birthday2 = Birthday.new("May", "Day", date2)
    birthday3 = Birthday.new("May", "Day", date3)
    subject.store(birthday1)
    subject.store(birthday2)
    subject.store(birthday3)
  end
end
