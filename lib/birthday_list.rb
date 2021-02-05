# frozen_string_literal: true
require 'date'

class BirthdayList
  def initialize
    @list = []
    @year =  Date.today.strftime('%Y').to_i
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
      date = Date.parse(x[1])
      if date.strftime('%d %b') == Date.today.strftime('%d %b')
        bdayyear = date.year.to_i
        diff = @year-bdayyear
        puts "It's #{x[0]}'s birthday today! #{x[0]} is #{diff} years old!"
      end
    end
  end

end
