require 'date'

class Birthday
  attr_reader :name, :date

  def initialize(name, date)
    @name, @date = name, date
  end
end
