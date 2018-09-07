require 'date'

class BirthdayList
  DATE_FORMAT = '%m-%d'

  def initialize
    @list = []
  end

  def add(name, date)
    @list << { name: name, birthday: date }
  end

  def show
    @list.each do |bday|
      puts "#{bday[:name]}: #{bday[:birthday]}"
    end
  end

  def check
    @list.each do |bday|
      puts "It's #{bday[:name]}'s birthday today! They are #{age(bday)} years old!" if today?(bday)
    end
  end

  private

  def age(bday)
    Time.now.year - Date.parse(bday[:birthday]).year
  end

  def today?(bday)
    birthday_date(bday) == today
  end

  def birthday_date(bday)
    Date.parse(bday[:birthday]).strftime(DATE_FORMAT)
  end

  def today
    Time.now.strftime(DATE_FORMAT)
  end
end
