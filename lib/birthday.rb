class Birthday
  attr_accessor :name, :date

  def initialize(name, date)
    @name = name
    @date = date
  end

  def calculate_age
    age = today.year - dob_year
    age -= 1 if today.month < dob_month || (today.month == dob_month && today.day < dob_day)
    return age
  end

  private

  def today
    Time.now
  end

  def dob_day
    @date.split("/")[0].to_i
  end

  def dob_month
    @date.split("/")[1].to_i
  end

  def dob_year
    @date.split("/")[2].to_i
  end
end
