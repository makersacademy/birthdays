
require 'date'

class BirthdayList

YEAR = Date.today.strftime('%Y').to_i

  def initialize
    @list = []
  end

  def add(name, date)
    @list << [name, date]
  end

  def view
    @list.each do |x|
      puts "Name: #{x[0]}, Birthday: #{x[1]}"
    end
  end


  def check
    @list.each do |x|
      if today?(x[1])
        bdayyear = Date.parse(x[1]).strftime('%Y').to_i
        puts "It's #{x[0]}'s birthday today! #{x[0]} is #{age(bdayyear)} years old!"
      end
    end
  end

  private

  def today
    Date.today.strftime('%d %b')
  end

  def birthday(day)
    Date.parse(day).strftime('%d %b')
  end

  def today?(day)
    today == birthday(day)
  end

  def age(year)
    YEAR - year
  end

end
