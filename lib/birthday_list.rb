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
      d = Date.parse(hash[:birthday])
      if Date.today.mon == d.mon && Date.today.mday == d.mday
        puts "It's #{hash[:name]}'s birthday today! They are #{Date.today.year - d.year} years old!"
      end
    end
  end
end