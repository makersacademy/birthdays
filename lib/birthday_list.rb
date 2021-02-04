# frozen_string_literal: true
require 'date'

class BirthdayList
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
      date = Date.parse(x[1].to_s)
      if date.strftime('%d %b %Y') == Date.today.strftime('%d %b %Y')
        puts "It's #{x[0]}'s birthday today! #{x[0]} is 100 years old!"
      end
    end
  end
end
