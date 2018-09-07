require "date"
class BirthdayList

  def initialize
    @list = []
  end

  def add_birthday(name, input_date)
    date = Date.strptime(input_date, "%d-%m-%y")
    @list << {name: name, date: date}
  end

  def print_list
    string = ""
    @list.each do |hash|
      string += "#{hash[:name]}: #{hash[:date].strftime("%d/%m/%Y")}\n"
    end
    string
  end

  def birthday_search(input_date)
    @list.each do |hash|
  #    binding.pry
      if Date.today.strftime("%d/%m") == hash[:date].strftime("%d/%m")
#      if Date.strptime(input_date, "%d-%m-%y") == hash[:date] then
        return "It's #{hash[:name]}'s birthday today! They are #{Date.today.strftime("%Y").to_i - hash[:date].strftime("%Y").to_i} years old!"
      else
        return
      end
    end
  end

end
