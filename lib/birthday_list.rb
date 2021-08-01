require 'birthday'

class BirthdayList
  attr_reader :list

  def initialize
    @list = []
  end
  
  def add birthday
    @list << birthday
    "Added birthday for #{birthday.name}"
  end

  def show_all
    str = "All Birthdays\n\n"

    @list.each { |bd| str << "#{bd.name} - #{bd.date.strftime("%B %d, %Y")}\n" }

    puts str
    str
  end

  def show_today
    str = "Today's Birthdays\n\n"
    todays = @list.select { |bd| same_date(Date.today, bd.date) }

    todays.each { |bd| str << "#{bd.name} is #{age(bd.date)} today!\n" }

    puts str
    str
  end

  private

  def same_date(date1, date2)
    date1.month == date2.month && date1.day == date2.day
  end

  def age date
    Date.today.year - date.year
  end
end
