class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = []
  end

  def store_birthday(birthday)
    @birthdays << birthday
  end

  def see_birthdays
    @birthdays.each { |birthday| puts "#{birthday.name}: #{birthday.date}"}
  end

  def check_birthday
    @birthdays.each do |birthday|
      if today == birthday.date[0..4]
        puts "It's #{birthday.name}'s birthday today! They are #{birthday.calculate_age} years old!"
      end
    end
  end

  private

  def today
    Time.now.strftime("%d/%m")
  end
end
