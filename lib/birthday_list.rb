class Birthdays
  attr_reader :list

  def initialize
    @list = []
  end

  def store(birthday)
    @list << birthday
  end

  def view_all
    @list.each do |record| 
      puts "Name: #{record.name} | Birthday: #{record.birthday}"
    end
  end

  def check_birthday
    names = @list.select do |record|
      date_formatting(record.birthday) == date_formatting(Time.now)
    end
    names
  end

  def age(birthday)
    Time.now.year - birthday.birthday.year
  end

  def date_formatting(date)
    date.strftime("%d-%m")
  end

end
