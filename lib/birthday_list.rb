class BirthdayList
  def initialize
    @list = []
  end

  def add(name, birthday)
    @list << { name: name, birthday: birthday }
  end

  def show
    @list.each {
      |friend_bday| puts "#{friend_bday[:name]}, #{friend_bday[:birthday]}"
    }
  end
end
