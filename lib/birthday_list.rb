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

  def birth_year(subject)
    subject[:birthday].split('').last(4).join("").to_i
  end


  def check
    #this_year = 
    @birthday_list.each {|person|
     # birth_year = person[:birthday].split('').last(4).join("").to_i
      age = this_year - birth_year(person)
      birthday = person[:birthday].split("").first(5).join
      today = Time.now.strftime("%d/%m")
      if birthday == today
        return "it is #{person[:name]}\'s birthday today, they are #{age} years old!"
      end
                          }
  end
  




end
