require 'time'

class Birthday
  attr_reader :first_name, :second_name, :birthday

  def initialize(first_name, second_name, birthday)
    @first_name = first_name
    @second_name = second_name
    @birthday = parse_date(birthday)
  end

  def name
    "#{@first_name} #{@second_name}"
  end

  private

  def parse_date(date)
    Time.parse(date)
  end
end
