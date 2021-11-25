require "date"

class Birthday 

  attr_reader :name, :day, :month, :year

  def initialize(name, day, month, year)
    @name = name
    @day = day
    @month = month
    @year = year
  end

  def calculate_age
    birthday = Date.parse("#{@day}/#{month}/#{year}")
    age_in_days = (Date.today - birthday).to_i
    age_in_days / 365
  end

end