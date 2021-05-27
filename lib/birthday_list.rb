require 'date'

class Birthday
  def initialize
    @birthday = []
  end

  def store(name, birthday)
    @birthday << {name: name, birthday: birthday}
    {name: name, birthday: birthday}
  end

  def show
    @birthday.each { |hash| puts "#{hash[:name]}'s birthday is on #{hash[:birthday]}" }
  end

  def today
    @birthday.each do |hash|
      puts "It's #{hash[:name]}'s birthday today! They are #{age(hash[:birthday])} years old!" if today?(hash[:birthday])
    end
  end

  private

  def age(date) # date is a string
    Date.today.year - Date.parse(date).year
  end

  def today?(date) # returns true if date matches today, otherwise false. 
    Date.today.mon == Date.parse(date).mon && Date.today.mday == Date.parse(date).mday
  end

end