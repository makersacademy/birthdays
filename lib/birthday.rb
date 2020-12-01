require "Date"

class Birthday

  attr_reader :written_date, :name, :birthdate, :age

  def initialize(name, date)
    @name = name
    @birthdate = date
    @written_date = write_date(date)
    @age = age?
  end

  def age?
    today = Date.today.year.to_s.to_i 
    birth_year = parse_year(birthdate).to_s.to_i 
    today - birth_year
  end

  private

  def parse_year(date)
    new_date = Date.strptime(date, "%d/%m/%Y")
    new_date.year
  end

  def write_date(date)
    read_date = Date.strptime(date, "%d/%m/%Y")
    read_date.strftime("%B %d, %Y")
  end
end
