require 'date'

class BirthdayList

  def initialize
    @birthday_list = Hash.new
  end

  # input name and date of birth in the format of YYYY/MM/DD
  def add_to_list(name, dob)
    @birthday_list[name] = str_to_date(dob)
    puts "#{name} has been added to the list!"
  end

  def print_list
    @birthday_list.collect do |name, dob|
      puts "#{name}: #{date_to_str(dob)}"
    end
  end
  
  def have_birthday_on(today = Date.today)
    @birthday_list.each do |name, dob|
      if today.month == dob.month && today.day == dob.day
        puts "It's #{name}'s birthday today! They are #{age_today(name)} years old!"
      end
    end
  end

  def age_today(name, today = Date.today)
    dob = @birthday_list[name]
    compute_age(dob, today)
  end

  private

  def str_to_date(dob)
    Date.strptime(dob, "%Y/%m/%d")
  end

  def date_to_str(dob)
    dob.strftime("%Y/%m/%d")
  end

  def compute_age(dob, today)
    age = today.year - dob.year
    age -= 1 if !had_birthday_this_year?(dob, today)
    age
  end

  def had_birthday_this_year?(dob, today)
    today.month > dob.month ||
      (today.month == dob.month && today.day >= dob.day)
  end
    


   
end
