require 'date'

class BirthdayList
  def initialize
    @list = []
  end
  
  def add birthday
    @list << birthday
    "Added birthday for #{birthday.name}"
  end

  def list
    str = "All Birthdays\n\n"

    @list.each { |bdy| str << "#{bdy.name} - #{bdy.date.strftime("%B %d, %Y")}\n"}

    str.chomp
  end

  def today
    str = "Today's Birthdays:\n"
    todays = @list.select { |bdy| same_date(Date.today, bdy.date) }

    todays.each { |bdy| str << "#{bdy.name} is #{age(bdy.date)} today!\n" }

    str.chomp
  end

  private

  def same_date(date1, date2)
    date1.month == date2.month && date1.day == date2.day
  end

  def age date
    Date.today.year - date.year
  end
end
