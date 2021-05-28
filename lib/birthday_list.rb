# frozen_string_literal: true

require 'date'

# A birthday list class
class Birthday
  def initialize
    @birthday = []
  end

  def store(name, birthday)
    @birthday << { name: name, birthday: birthday }
    { name: name, birthday: birthday }
  end

  def show
    @birthday.each { |hash| puts "#{hash[:name]}'s birthday is on #{hash[:birthday]}" }
  end

  def today
    @birthday.each do |hash|
      if today?(hash[:birthday])
        puts "It's #{hash[:name]}'s birthday today! They are #{age(hash[:birthday])} years old!"
      end
    end
  end

  private

  # date is a string
  def age(date)
    Date.today.year - Date.parse(date).year
  end

  # returns true if date matches today, otherwise false.
  def today?(date)
    Date.today.mon == Date.parse(date).mon && Date.today.mday == Date.parse(date).mday
  end
end
