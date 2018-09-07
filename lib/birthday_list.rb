
class BirthdayList

  def initialize
    @list = []
  end

  def add_birthday(name, date)
    @list << {name: name, date: date}
  end

  def print_list
    string = ""
    @list.each do |hash|
      string += "#{hash[:name]}: #{hash[:date]}\n"
    end
    string
  end

  def birthday_search(input_date)
    @list.each do |hash|
      if input_date == hash[:date] then
        return "It's #{hash[:name]}'s birthday today!"
      else
        return
      end
    end
  end

end
