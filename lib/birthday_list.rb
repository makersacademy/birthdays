class BirthdayList
  def initialize
    @birthdays = []
  end

  def size
    @birthdays.count
  end

  def add(birthday)
    @birthdays << birthday
  end

  def birthday_check(today)
    @birthdays.each do |birthday|
      print_reminder(birthday, today) if birthday.birthday_today?(today)
    end
  end

  def print_all_birthdays
    @birthdays.each do |birthday|
      puts "#{birthday.name} - #{friendly_date(birthday.birthdate)}"
    end
  end

  private

  def friendly_date(date)
    "#{pad_number(date.day)}/#{pad_number(date.month)}"
  end

  def pad_number(number)
    number.to_s.rjust(2, '0')
  end

  def print_reminder(birthday, today)
    puts [ 
      "It is #{birthday.name}'s birthday today!",
      "They are #{birthday.age(today)} years old!"
    ].join(' ')
  end
end
