require 'date'

class BirthdayTracker
  def initialize
    @storage = Hash.new
  end

  attr_reader :storage

  def store(name, dob)
    @storage[name] = dob 
  end

  def all
    @storage.each do |name, dob|
      puts "#{name}: #{dob}"
    end
  end

  def today
    @storage.each do |name, dob|
      if birthday_today?(dob)
        puts "It's #{name}'s birthday today! They are #{age(dob)} years old!"
      end
    end
  end

  private

  def birthday_today?(dob)
    today = Date.today.strftime("%d %m") 
    birthday = Date.parse(dob).strftime("%d %m")
    today == birthday
  end

  def age(dob)
    current_year = Date.today.year
    birth_year = Date.parse(dob).year
    current_year - birth_year
  end
end
