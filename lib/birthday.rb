require "date"

class Birthday 

  attr_reader :name, :day, :month, :year

  MONTHS = ["unknown", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(name, day, month, year)
    @name = name
    @day = day
    @month = month
    @year = year
  end

  def month_text(month)
    MONTHS[month]
  end

  def calculate_age
    birthday = Date.parse("#{@day}/#{month}/#{year}")
    age_in_days = (Date.today - birthday).to_i
    age_in_days / 365
  end

end