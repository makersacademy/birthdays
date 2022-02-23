class BirthdayList
  attr_accessor :birthdays
  def initialize
    @birthdays = {}
    @datetoday = ['01', '12', '2022']
  end

  def add_birthday(name, birthday)
    @birthdays[name] = birthday
  end

  def todays_birthdays
    birthdays.each do |name, birthday|
      current_birthday = birthday.split('/')
      age_today = @datetoday[2].to_i - current_birthday[2].to_i

      if current_birthday[0] == @datetoday[0] && current_birthday[1] == @datetoday[1]
        puts "It's #{name}'s birthday today! They are #{age_today} years old!"
      end
    end
  end
end

birthday = BirthdayList.new
birthday.add_birthday('kenny', '01/12/1999')
birthday.todays_birthdays