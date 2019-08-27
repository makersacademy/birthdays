require 'date'

class BirthdayList

  def initialize
    @birthday_list = Hash.new
  end

  # input name and date of birth in the format of YYYY/MM/DD
  def add(name, dob)
    @birthday_list[name] = str_to_date(dob)
    puts "#{name} has been added to the list!"
  end

  def print_list
    @birthday_list.collect do |name, dob|
      puts "#{name}: #{date_to_str(dob)}"
    end
  end

  private

  def str_to_date(dob)
    Date.strptime(dob, "%Y/%m/%d")
  end

  def date_to_str(dob)
    dob.strftime("%Y/%m/%d")
  end
   
end
