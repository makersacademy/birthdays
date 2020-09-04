class Birthday

  def initialize
   @birthday_list = []
  end

  def add(name, birthday)
    @birthday_list << {:name => name, :birthday => birthday}
    @birthday_list
  end

  def print_list
    @birthday_list.each do |person|
      puts "#{person[:name]}, #{person[:birthday]}"
    end
  end

  def today
    @birthday_list.each do |person|
      date = Time.new
      today = date.strftime("%d %B")
      if person[:birthday] == today
        print "Today is #{person[:name]}'s birthday!"
      end
    end
  end

end
