class Birthday
  def initialize(name, date)
    @name = name
    @date = date
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def date
    @date
  end

  def formatted_date
    @date.strftime("%d/%m/%Y")
  end

  def age
    if @date.day <= Date.today.day and @date.month <= Date.today.month
      (Date.today.year - @date.year).to_s
    else
      (Date.today.year - @date.year - 1).to_s
    end
  end
end
