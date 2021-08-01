class BirthdayList
  attr_reader :all

  def initialize
    @all = Hash.new { |h, k| h[k] = [] }
  end
  
  def add birthday
    @all[birthday.date] << birthday.name
    return "Added birthday for #{birthday.name}"
  end
end
