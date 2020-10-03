require "date"
require_relative 'birthday'
 
class BirthdayList

  attr_accessor :list

  def initialize
    @list = []
  end

  def store_birthday(name, date)
    return "Your friend's birthday is already stored!" if name_exists?(name)
    add_person(name, date)
    return "#{name}'s birthday has been stored!"
  end

  def show_list
    list.each do |person|
      puts "#{person.name} || #{person.written_date}"
    end
    true
  end

  def today?
    today = Date.today.strftime("%d %m")
    no_bdays = print_birthday(today)
    birthday(no_bdays)
  end

  private

  def print_birthday(today)
    no_bday_count = 0
    list.each do |person|
      bdate = parsed_date(person.birthdate)
      if bdate == today
        puts "It's #{person.name}'s birthday today! They are #{person.age} years old!"
      else
        no_bday_count += 1
      end
    end
    no_bday_count
  end
  
  def birthday(num)
    return false if num == list.count
    true
  end

  def parsed_date(date)
    Date.parse(date).strftime("%d %m")
  end

  def name_exists?(name)
    list.each do |person|
      return true if person.name == name 
    end
    false
  end

  def add_person(name, date)
    person = Birthday.new(name, date)
    list << person
  end
end
