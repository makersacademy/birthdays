require 'date'

class Birthday
  attr_reader :name, :date

  def initialize(name, date)
    @name = name
    @date = Date.parse(date)
  end

  def display_string
    name.ljust(30) + date.strftime("%d/%m/%Y")
  end

  def today?
    Date.today.month == date.month && Date.today.day == date.day
  end

  def age
    t = Date.today
    adjust = t.month > date.month || (t.month == date.month && t.day >= date.day) ? 0 : 1
    t.year - date.year - adjust
  end
end
