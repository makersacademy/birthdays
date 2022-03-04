class Birthday
  attr_reader :name, :birthdate

  def initialize(name = "Unknown", birthdate = "Unknown")
    @name = name
    @birthdate = birthdate
  end

  def age(today)
    days_old = (today - @birthdate).to_i
    days_old / 365
  end

  def birthday_today?(today)
    @today = today
    same_month? && same_day?
  end

  private

  def same_month?
    @today.month === @birthdate.month
  end

  def same_day?
    @today.day === @birthdate.day
  end
end
