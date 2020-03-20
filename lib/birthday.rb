class Birthday
  attr_reader :date
  
  def initialize(day, month, year)
    @date = Time.new(year, month, day)
  end
end