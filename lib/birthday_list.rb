require 'date'
BirthDayList = Class.new

class Birthday

  DATE_FORMAT = '%m-%d'

  def age(friend)
    if already_born(friend)
      Time.now.year - Date.parse(friend[:birthday]).year
    else
      Time.now.year - Date.parse(friend[:birthday]).year - 1
    end
  end

  def birthday?(friend)
    today == birthday(friend)
  end

  private

  def already_born(friend)
    birthday(friend) <= Time.now.strftime(DATE_FORMAT)
  end

  def birthday(friend)
    Date.parse(friend[:birthday]).strftime(DATE_FORMAT)
  end

  def today
    Time.now.strftime(DATE_FORMAT)
  end

end

class BirthDayList

  DATE_FORMAT = '%m-%d'

  def initialize
    @birthday_array = []
  end

  def add(name, birthday)
    @birthday_array << { name: name, birthday: birthday }
  end

  def show
    @birthday_array.each do |friend|

      puts "#{friend[:name]}: #{friend[:birthday]}"
    end
  end

  def current_birthdays
    @birthday_array.each do |friend|
      birthday_message(friend) if Birthday.new.birthday?(friend)
    end
  end

private

  def birthday_message(friend)
    puts "Lucky #{friend[:name]}, today they're #{Birthday.new.age(friend)} years old!"
  end

end
