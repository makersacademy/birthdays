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

  DATE_FORMAT = '%d-%m'

  def check
    @list.each do |bday| 
      puts "#{bday[:name]}'s birthday. #{age(bday)} years old" if today?(bday)
    end
  end

  private
  def today?(birthday)
    birthday_date(birthday) == today_day
  end

  def birthday_date(birthday)
    Date.parse(birthday[:birthday]).strftime(DATE_FORMAT)
  end

  def today_day
    Time.now.strftime(DATE_FORMAT)
  end

  def age(birthday)
    Time.now.year - Date.parse(birthday[:birthday]).year
  end

end
