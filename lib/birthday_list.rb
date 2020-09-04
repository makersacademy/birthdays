require 'date'
require 'timecop'
class Birthdays 

  def initialize
    @birthday_list = Array.new
  end

  def add(name, date)
    @birthday_list.push({ name: name, birthday: date })
  end

  def show
    @birthday_list.each { |person| puts person }
  end

  def this_year
    Time.now.strftime("%Y").to_i
  end

  def birth_year(person)
    person[:birthday].split('').last(4).join("").to_i
  end

  def birthday?(person)
    person[:birthday].split("").first(5).join
  end

  def today?
    Time.now.strftime("%d/%m")
  end

  def persons_age(person)
    current_year = Time.now.strftime("%Y").to_i 
    birth_year = person[:birthday].split('').last(4).join("").to_i
    current_year - birth_year
  end

  def check
    @birthday_list.each do |person|
                        if birthday?(person) == today?
                          return "it is #{person[:name]}\'s birthday today, they are #{persons_age(person)} years old!"
                        end
                        end
  end

end
