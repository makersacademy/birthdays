require 'date'
BirthDayList = Class.new

class BirthDayList

  def initialize
    @birthday_array = []
    @this_day = Time.new.day
    @this_month = Time.new.month
    @this_year = Time.new.year
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
      birthday(friend)
      age
      puts_birthday(friend)
    end
  end

  private

  def age
    if born_month && born_day
      @age = @this_year - @bday_year
    else
      @age = @this_year - @bday_year - 1
    end
  end

  def born_month
    @bday_month <= @this_month
  end

  def born_day
    @bday_day <= @this_day
  end

  def birthday(friend)
    @bday_day = friend[:birthday].split('/').first.to_i
    @bday_month = friend[:birthday].split('/')[1].to_i
    @bday_year = friend[:birthday].split('/').last.to_i
  end

  def puts_birthday(friend)
    birthday_message(friend) if day_true && month_true
  end

  def day_true
    @bday_day == @this_day
  end

  def month_true
    @bday_month == @this_month
  end

  def birthday_message(friend)
    puts "Lucky #{friend[:name]}, today they're #{@age} years old!"
  end

end
