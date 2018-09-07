
class BirthdayList

  def initialize
    @list = []
  end

  def add_birthday(name, date)
    @list << {name: name, date: date}
  end

  def print_list
    string = ""
    @list.each do |name|
      string += "#{name}\n"
    end
    string
  end

end
